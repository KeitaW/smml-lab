#!/bin/bash
# Test memory and storage performance on an Amazon EC2 instance
# Caution: DO NOT RUN this script on a production instance with data you care about.
# This script will run performance tests on the first Amazon EC2 NVMe Instance Storage device it finds.
# Ensure that the device is safe to use. It may destroy data on the device.

set -euo pipefail

# Update package list and install required packages (nvme-cli and fio)
echo -e "\n===== Installing Required Packages ====="
sudo apt-get update
sudo apt-get install -y nvme-cli fio


# Gather system information
echo "===== CPU Information ====="
lscpu

echo -e "\n===== Memory Layout ====="
sudo lshw -short -C memory

echo -e "\n===== Block Devices ====="
lsblk

# List NVMe devices
echo -e "\n===== NVMe Devices ====="
sudo nvme list

# Detect the first Amazon EC2 NVMe Instance Storage device
echo -e "\nDetecting first 'Amazon EC2 NVMe Instance Storage' device..."
DEVICE=$(sudo nvme list | grep -m1 "Amazon EC2 NVMe Instance Storage" | awk '{print $1}')
if [ -z "$DEVICE" ]; then
  echo "No Amazon EC2 NVMe Instance Storage device found."
  exit 1
fi
echo "Found device: $DEVICE"

# IMPORTANT: Testing directly on the raw block device can destroy data!
# For testing performance, ensure that this device is safe to use (e.g., ephemeral instance storage).

# Run fio tests

# Sequential Read Test
echo -e "\n===== Running fio Sequential Read Test ====="
sudo fio --name=seqread \
    --filename="$DEVICE" \
    --ioengine=libaio \
    --iodepth=32 \
    --rw=read \
    --bs=1M \
    --direct=1 \
    --size=4G \
    --runtime=60 \
    --group_reporting

# Sequential Write Test
echo -e "\n===== Running fio Sequential Write Test ====="
sudo fio --name=seqwrite \
    --filename="$DEVICE" \
    --ioengine=libaio \
    --iodepth=32 \
    --rw=write \
    --bs=1M \
    --direct=1 \
    --size=4G \
    --runtime=60 \
    --group_reporting

# Random Read Test
echo -e "\n===== Running fio Random Read Test ====="
sudo fio --name=randread \
    --filename="$DEVICE" \
    --ioengine=libaio \
    --iodepth=64 \
    --rw=randread \
    --bs=4k \
    --direct=1 \
    --size=1G \
    --numjobs=4 \
    --runtime=60 \
    --group_reporting

# Random Write Test
echo -e "\n===== Running fio Random Write Test ====="
sudo fio --name=randwrite \
    --filename="$DEVICE" \
    --ioengine=libaio \
    --iodepth=64 \
    --rw=randwrite \
    --bs=4k \
    --direct=1 \
    --size=1G \
    --numjobs=4 \
    --runtime=60 \
    --group_reporting

echo -e "\nPerformance tests completed."
