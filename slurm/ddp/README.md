## Minimal PyTorch DDP Example on Slurm with Enroot/Pyxis

This repository demonstrates how to run multi-node distributed training using PyTorch's Distributed Data Parallel (DDP) on a Slurm cluster. It leverages **Enroot** and **Pyxis** for containerized execution, providing a streamlined and reproducible environment.

### Prerequisites

- **Slurm** installed and configured on your cluster.
- **Enroot** and **Pyxis** installed and integrated with Slurm. Refer to [Enroot documentation](https://github.com/NVIDIA/enroot) and [Pyxis documentation](https://github.com/NVIDIA/pyxis) for installation instructions.
- Familiarity with PyTorch DDP. See the [PyTorch DDP tutorial](https://pytorch.org/tutorials/intermediate/ddp_tutorial.html).

## Building the Environment

The containerized environment is built using a Docker image, converted into a SquashFS file for Enroot compatibility. The process is automated via the provided `Makefile`.

Run the following command to build the environment:

```bash
make
```

- This pulls the latest AWS-optimized GPU image (`public.ecr.aws/hpc-cloud/nccl-tests:latest`) and builds a local image with PyTorch pre-installed.
- The resulting SquashFS file (`pytorch.sqsh`) will be created in the project directory.


## Submitting a Training Job

Submit the training job to Slurm with the following command:

```bash
sbatch train.sbatch
```

The `train.sbatch` script handles:
- Setting up necessary environment variables for PyTorch DDP (e.g., `MASTER_ADDR`, `MASTER_PORT`, `WORLD_SIZE`).
- Launching the training script (`ddp.py`) inside the container using Enroot/Pyxis.

---

## Logs

Training logs are saved in the `logs` directory, named as `ddp-container_<job_id>.out`. These logs include outputs from all nodes participating in the job.

---

## File Descriptions

- **`ddp.py`**: The main script implementing distributed training using PyTorch DDP.
- **`Dockerfile`**: Defines the base environment for PyTorch, including dependencies.
- **`Makefile`**: Automates the process of building and importing the Docker image into an Enroot-compatible SquashFS format.
- **`train.sbatch`**: A Slurm batch script for submitting distributed training jobs.
- **`pytorch.sqsh`**: The SquashFS container image generated from the Dockerfile.
