# Demo: HyperPod task governance and flexible training plan

## Pre-requisites

You need to set up an EKS cluster. Follow instructions in HyperPod workshop for exact steps to set them up. 

```bash
export AWS_REGION=us-east-2
export CLUSTER_NAME=hyperpod-eks-tg-cluster
export STACK_ID=hyperpod-eks-full-stack-tg
export AWS_PROFILE=compute-sa-team-Admin 
export ACCEL_INSTANCE_TYPE=ml.p5en.48xlarge
export TRAININGPLAN_ARN=arn:aws:sagemaker:us-east-2:159553542841:training-plan/hyperpod-eks-tp-test
```

```bash
aws eks update-kubeconfig --region ${AWS_REGION} --name ${CLUSTER_NAME}
```

## Setup HyperPod compute with flexible training plan

This part is mostly just a copy from HP workshop.
https://catalog.workshops.aws/sagemaker-hyperpod-eks

###  Setup Environment Variables

1. First source in all the environment variables you need leveraging the output from the previously deployed CloudFormation stack:

```bash
curl 'https://static.us-east-1.prod.workshops.aws/public/fe335830-10df-4042-bc05-78eb1af36236/static/scripts/create_config.sh' --output create_config.sh
bash create_config.sh
source env_vars
```

2. Download the default lifecycle script on_create.sh from GitHub, and upload it to your S3 bucket:

```bash
curl https://raw.githubusercontent.com/aws-samples/awsome-distributed-training/main/1.architectures/7.sagemaker-hyperpod-eks/LifecycleScripts/base-config/on_create.sh --output on_create.sh

aws s3 cp on_create.sh s3://$BUCKET_NAME
```

### Configure the EKS cluster

Run the `aws eks update-kubeconfig` command to update your local kube config file (located at `~/.kube/config`) with the credentials and configuration needed to connect to your EKS cluster using the kubectl command.


```bash
aws eks update-kubeconfig --region ${AWS_REGION} --name ${CLUSTER_NAME}
```

###  Install Dependencies

Helm, the package manager for Kubernetes, is an open-source tool for setting up a installation process for Kubernetes clusters. It enables the automation of dependency installations and simplifies various setups needed for EKS on HyperPod. The HyperPod service team provides a Helm chart package, which bundles key dependencies and associated permission configurations. See the What Gets Installed section for details.


```bash
git clone https://github.com/aws/sagemaker-hyperpod-cli.git
pushd sagemaker-hyperpod-cli/helm_chart
helm dependencies update HyperPodHelmChart
helm install hyperpod-dependencies HyperPodHelmChart
popd 
```
### Create the HyperPod Cluster

We'll create a HyperPod cluster configuration file (`cluster-config.json`) that points to the EKS cluster as the orchestrator for new instance groups that will be created. The example below creates two instance groups, one for your accelerated compute nodes (ml.p5en.48xlarge procured through the flexible training plan), and an additional instance group containing a general purpose compute node (ml.m5.2xlarge by default) used to host pods that do not require accelerated compute capacity.

```bash
cat > cluster-config.json << EOL
{
    "ClusterName": "ml-cluster-task-governance",
    "Orchestrator": { 
      "Eks": 
      {
        "ClusterArn": "${EKS_CLUSTER_ARN}"
      }
    },
    "InstanceGroups": [
      {
        "InstanceGroupName": "worker-group-1",
        "InstanceType": "ml.g5.48xlarge",
        "InstanceCount": ${ACCEL_COUNT},
        "InstanceStorageConfigs": [
          {
            "EbsVolumeConfig": {
              "VolumeSizeInGB": ${ACCEL_VOLUME_SIZE}
            }
          }
        ],
        "LifeCycleConfig": {
          "SourceS3Uri": "s3://${BUCKET_NAME}",
          "OnCreate": "on_create.sh"
        },
        "ExecutionRole": "${EXECUTION_ROLE}",
        "ThreadsPerCore": 2
      },
      {
        "InstanceGroupName": "worker-group-2",
        "InstanceType": "${GEN_INSTANCE_TYPE}",
        "InstanceCount": ${GEN_COUNT},
        "InstanceStorageConfigs": [
          {
            "EbsVolumeConfig": {
              "VolumeSizeInGB": ${GEN_VOLUME_SIZE}
            }
          }
        ],
        "LifeCycleConfig": {
          "SourceS3Uri": "s3://${BUCKET_NAME}",
          "OnCreate": "on_create.sh"
        },
        "ExecutionRole": "${EXECUTION_ROLE}",
        "ThreadsPerCore": 1
      }
    ],
    "VpcConfig": {
      "SecurityGroupIds": ["$SECURITY_GROUP"],
      "Subnets":["$SUBNET_ID"]
    },
    "NodeRecovery": "${NODE_RECOVERY}"
}
EOL
```


You need `aws-cli/2.22.23` or later to run the following command:

```bash
aws sagemaker create-cluster \
    --cli-input-json file://cluster-config.json \
    --region $AWS_REGION
```


If you get following error message, you are likely using older CLI.

> Unknown parameter in InstanceGroups[0]: "TrainingPlanArn", must be one of: InstanceCount, InstanceGroupName, InstanceType, LifeCycleConfig, ExecutionRole, ThreadsPerCore, InstanceStorageConfigs, OnStartDeepHealthChecks

## Setup for SageMaker HyperPod task governance

### Setup Container Insights

The following section includes the prerequisites needed before installing the Amazon EKS Observability add-on.

```bash
export EX_ROLE_NAME=$(echo $EXECUTION_ROLE | sed 's/.*\///') 
aws iam attach-role-policy \
--role-name ${EX_ROLE_NAME} \
--policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy
```

Install the Amazon CloudWatch Observability EKS add-on.

```bash
aws eks create-addon --addon-name amazon-cloudwatch-observability --cluster-name $EKS_CLUSTER_NAME
```

The install task governance addon:

```bash
aws eks create-addon --cluster-name ${EKS_CLUSTER_NAME} --addon-name amazon-sagemaker-hyperpod-taskgovernance
```


## Submit your first job 

### HyperPod CLI

```bash
git clone git@github.com:aws/sagemaker-hyperpod-cli.git
cd sagemaker-hyperpod-cli
pip install .
```


```bash
hyperpod connect-cluster --cluster-name ml-cluster-task-governance
```

```bash
hyperpod start-job --job-name hyperpod-cli-test --job-kind kubeflow/PyTorchJob --image docker.io/kubeflowkatib/pytorch-mnist-cpu:v1beta1-bc09cfd --entry-script /opt/pytorch-mnist/mnist.py --pull-policy IfNotPresent --instance-type ml.g5.xlarge --node-count 1 --tasks-per-node 1 --results-dir ./result 
```

```
2024-12-26 13:26:22 - hyperpod_cli.validators.job_validator - ERROR - Scheduler type is 'SageMaker' however cannot find namespace 'kubeflow' managed by SageMaker. Please ensure namespace exists and you have 'get' access to it.
```

## References

* https://aws.amazon.com/blogs/machine-learning/speed-up-your-cluster-procurement-time-with-amazon-sagemaker-hyperpod-training-plans/
* https://aws.amazon.com/blogs/aws/maximize-accelerator-utilization-for-model-development-with-new-amazon-sagemaker-hyperpod-task-governance/
* https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-hyperpod-eks-operate-console-ui-governance-setup.htm
 