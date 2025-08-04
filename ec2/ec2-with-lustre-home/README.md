# EC2 with FSx for Lustre Home Directory Reference Architecture

## Overview

This reference architecture provides CloudFormation templates to deploy an EC2 instance backed by AWS Deep Learning AMI (DLAMI) with FSx for Lustre mounted as the home directory. This setup is ideal for machine learning workloads that require high-performance shared storage.

The architecture consists of two CloudFormation stacks:
1. **Infrastructure Stack**: Deploys VPC, FSx for Lustre filesystem, and associated networking components
2. **EC2 Stack**: Deploys an EC2 instance that automatically mounts the FSx for Lustre filesystem as the home directory

## Architecture Components

### Infrastructure Stack
- **VPC**: Single VPC with public subnet for simplified deployment
- **FSx for Lustre**: High-performance filesystem for home directory storage
- **Data Repository Association (DRA)**: Provides better control over S3 data synchronization with auto-import/export policies
- **Security Groups**: Configured for FSx and EC2 communication
- **Internet Gateway**: Enables internet connectivity for public subnet
- **Route Tables**: Configured for public subnet routing

### EC2 Stack
- **EC2 Instance**: Based on AWS Deep Learning AMI (DLAMI)
- **Elastic IP**: Static public IP address for persistent connectivity
- **User Data Script**: Automatically mounts FSx for Lustre as home directory
- **IAM Role**: Necessary permissions for FSx access
- **Security Group**: Allows SSH access and FSx communication

## Prerequisites

- AWS Account with appropriate permissions to create:
  - VPC and networking resources
  - FSx for Lustre filesystem
  - EC2 instances
  - IAM roles and policies
  - Security groups
  - S3 buckets
- AWS CLI configured with credentials
- SSH key pair created in the target AWS region
- S3 bucket for FSx for Lustre Data Repository Association (DRA)

## Deployment Instructions

Set environment variables for deployment:
```bash
export AWS_REGION="us-east-1"              # Replace with your target region
export AVAILABILITY_ZONE="us-east-1f"      # Replace with your target AZ (must be in the same region)
export KEY_PAIR_NAME="my-key-pair"         # Replace with your key pair name
export INSTANCE_TYPE="g4dn.xlarge"         # Optional: change instance type
export CAPACITY_RESERVATION_ID=""          # Optional: specify ODCR ID (e.g., "cr-0123456789abcdef0")
```

### Step 0: Prepare S3 Bucket for Data Repository Association

Create an S3 bucket for FSx for Lustre DRA (skip if you already have one):
```bash
export S3_BUCKET_NAME="fsx-lustre-dra-$(date +%s)"  # Or use your existing bucket name
aws s3 mb s3://${S3_BUCKET_NAME} --region ${AWS_REGION}
```

### Step 1: Create EC2 Key Pair (if not already created)

If you don't have an EC2 key pair in your target region, create one:

```bash
aws ec2 create-key-pair \
  --region ${AWS_REGION} \
  --key-name my-key-pair \
  --query 'KeyMaterial' \
  --output text > my-key-pair.pem

chmod 400 my-key-pair.pem
```

### Step 2: Deploy Infrastructure Stack

```bash
aws cloudformation create-stack \
  --region ${AWS_REGION} \
  --stack-name fsx-lustre-infrastructure \
  --template-body file://infrastructure-stack.yaml \
  --parameters \
    ParameterKey=AvailabilityZone,ParameterValue=${AVAILABILITY_ZONE} \
    ParameterKey=FSxStorageCapacity,ParameterValue=1200 \
    ParameterKey=FSxThroughput,ParameterValue=200 \
    ParameterKey=S3BucketName,ParameterValue=${S3_BUCKET_NAME} \
    ParameterKey=FileSystemPath,ParameterValue=/imported-data/ \
    ParameterKey=DataRepositoryPath,ParameterValue=s3://${S3_BUCKET_NAME}/imported-data/ \
  --capabilities CAPABILITY_IAM
```

Wait for the infrastructure stack to complete:
```bash
aws cloudformation wait stack-create-complete \
  --region ${AWS_REGION} \
  --stack-name fsx-lustre-infrastructure
```

### Step 3: Deploy EC2 Instance Stack with Automated Parameters

Deploy the EC2 stack using outputs from the infrastructure stack:
```bash
aws cloudformation create-stack \
  --region ${AWS_REGION} \
  --stack-name fsx-lustre-ec2 \
  --template-body file://ec2-instance-stack.yaml \
  --parameters \
    ParameterKey=VPCId,ParameterValue=$(aws cloudformation describe-stacks --region ${AWS_REGION} --stack-name fsx-lustre-infrastructure --query 'Stacks[0].Outputs[?OutputKey==`VPCId`].OutputValue' --output text) \
    ParameterKey=SubnetId,ParameterValue=$(aws cloudformation describe-stacks --region ${AWS_REGION} --stack-name fsx-lustre-infrastructure --query 'Stacks[0].Outputs[?OutputKey==`SubnetId`].OutputValue' --output text) \
    ParameterKey=FSxFileSystemId,ParameterValue=$(aws cloudformation describe-stacks --region ${AWS_REGION} --stack-name fsx-lustre-infrastructure --query 'Stacks[0].Outputs[?OutputKey==`FSxFileSystemId`].OutputValue' --output text) \
    ParameterKey=FSxMountName,ParameterValue=$(aws cloudformation describe-stacks --region ${AWS_REGION} --stack-name fsx-lustre-infrastructure --query 'Stacks[0].Outputs[?OutputKey==`FSxMountName`].OutputValue' --output text) \
    ParameterKey=SecurityGroupId,ParameterValue=$(aws cloudformation describe-stacks --region ${AWS_REGION} --stack-name fsx-lustre-infrastructure --query 'Stacks[0].Outputs[?OutputKey==`SecurityGroupId`].OutputValue' --output text) \
    ParameterKey=KeyPairName,ParameterValue=${KEY_PAIR_NAME} \
    ParameterKey=InstanceType,ParameterValue=${INSTANCE_TYPE} \
    ParameterKey=CapacityReservationId,ParameterValue=${CAPACITY_RESERVATION_ID:-} \
  --capabilities CAPABILITY_IAM
```

Wait for the EC2 stack to complete:
```bash
aws cloudformation wait stack-create-complete \
  --region ${AWS_REGION} \
  --stack-name fsx-lustre-ec2
```

### Step 4: Connect to EC2 Instance

Once the EC2 stack is deployed, get the instance Elastic IP address:
```bash
aws cloudformation describe-stacks \
  --region ${AWS_REGION} \
  --stack-name fsx-lustre-ec2 \
  --query 'Stacks[0].Outputs[?OutputKey==`ElasticIPAddress`].OutputValue' \
  --output text
```

Alternatively, you can get the complete SSH command directly from the stack outputs:
```bash
aws cloudformation describe-stacks \
  --region ${AWS_REGION} \
  --stack-name fsx-lustre-ec2 \
  --query 'Stacks[0].Outputs[?OutputKey==`SSHCommand`].OutputValue' \
  --output text
```

Connect via SSH:
```bash
ssh -i <your-key.pem> ubuntu@<elastic-ip-address>
```

Verify FSx for Lustre is mounted:
```bash
df -h | grep fsx
mount | grep lustre
```

## Configuration Parameters

### Infrastructure Stack Parameters
- `AvailabilityZone`: AWS Availability Zone for deploying resources (e.g., us-east-1f)
- `FSxStorageCapacity`: Storage capacity in GB (minimum 1200, increments of 1200)
- `FSxThroughput`: Per unit storage throughput in MB/s per TiB (50, 100, 200, 400 for PERSISTENT_2)
- `S3BucketName`: S3 bucket name for Data Repository Association
- `FileSystemPath`: Path within the file system to link with S3 (default: /imported-data/)
- `DataRepositoryPath`: S3 path for data repository association (e.g., s3://bucket-name/prefix/)
- `ImportedFileChunkSize`: Chunk size in MiB for imported files (default: 1024)
- `VPCCidr`: CIDR block for VPC (default: 10.0.0.0/16)
- `PublicSubnetCidr`: CIDR block for public subnet (default: 10.0.1.0/24)
- `Compression`: Data compression type (LZ4 or NONE, default: LZ4)
- `LustreVersion`: Lustre software version (2.15 or 2.12, default: 2.15)

### EC2 Instance Stack Parameters
- `InstanceType`: EC2 instance type (default: g4dn.xlarge)
- `KeyPairName`: Name of existing EC2 key pair for SSH access
- `AllowedSSHCidr`: CIDR block allowed for SSH access (default: 0.0.0.0/0)
- `VolumeSize`: Root EBS volume size in GB (default: 100)
- `CapacityReservationId`: Capacity Reservation ID to use for launching the instance (optional)

## Cost Considerations

- **FSx for Lustre**: Charged per GB-month of storage capacity and throughput
- **EC2 Instance**: Charged per hour based on instance type
- **Data Transfer**: Charges may apply for data transfer out of AWS
- **EBS Storage**: Charged for root volume storage

## Security Considerations

- The default configuration allows SSH access from anywhere (0.0.0.0/0). Restrict this to your IP range for production use
- FSx for Lustre traffic is restricted to within the VPC
- Consider enabling VPC Flow Logs for monitoring
- Use Systems Manager Session Manager as an alternative to direct SSH access

## Troubleshooting

### FSx for Lustre Not Mounting
1. Check security group rules allow traffic on port 988 (Lustre)
2. Verify the FSx filesystem is in AVAILABLE state
3. Check EC2 instance logs: `sudo journalctl -u cloud-init`

### Cannot Connect via SSH
1. Verify security group allows inbound SSH (port 22) from your IP
2. Check instance is in running state
3. Ensure you're using the correct key pair
4. Verify Elastic IP is properly associated with the instance

### Performance Issues
1. Ensure instance type supports network performance for FSx throughput
2. Check FSx metrics in CloudWatch
3. Verify application is using appropriate I/O patterns for Lustre

## Cleanup

To avoid ongoing charges, delete the stacks in reverse order:

```bash
# Delete EC2 instance stack first
aws cloudformation delete-stack --region ${AWS_REGION} --stack-name fsx-lustre-ec2
aws cloudformation wait stack-delete-complete --region ${AWS_REGION} --stack-name fsx-lustre-ec2

# Then delete infrastructure stack
aws cloudformation delete-stack --region ${AWS_REGION} --stack-name fsx-lustre-infrastructure
aws cloudformation wait stack-delete-complete --region ${AWS_REGION} --stack-name fsx-lustre-infrastructure
```

## Additional Resources

- [FSx for Lustre Documentation](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html)
- [AWS Deep Learning AMI](https://docs.aws.amazon.com/dlami/latest/devguide/what-is-dlami.html)
- [CloudFormation Best Practices](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/best-practices.html)
- [AWS Distributed Training Reference Architectures](https://github.com/aws-samples/awsome-distributed-training)

## License

This reference architecture is provided under the MIT License. See LICENSE file for details.