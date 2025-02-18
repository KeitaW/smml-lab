#!/usr/bin/env bash
set -euxo pipefail

# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: MIT-0

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
chmod +x Miniconda3-latest-Linux-x86_64.sh
./Miniconda3-latest-Linux-x86_64.sh -b -f -p ~/miniconda3

source ~/miniconda3/bin/activate

conda create -y -p ~/conda_pytorch python=3.11

source activate ~/conda_pytorch

pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu126
