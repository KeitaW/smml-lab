#!/bin/bash
#SBATCH --job-name=diagnose-gpu-failure
#SBATCH --output=diagnose-gpu-failure.out
#SBATCH --nodes=2


srun --ntasks-per-node=1 sudo nvidia-bug-report.sh -o nvidia-bug-report-$(cat /sys/devices/virtual/dmi/id/board_asset_tag | tr -d " ")