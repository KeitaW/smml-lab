FROM ubuntu:latest

# Download Nsight Systems
RUN apt update \
    && apt install -y --no-install-recommends gnupg \
    && echo "deb http://developer.download.nvidia.com/devtools/repos/ubuntu$(source /etc/lsb-release; echo "$DISTRIB_RELEASE" | tr -d .)/$(dpkg --print-architecture)/" | tee /etc/apt/sources.list.d/nvidia-devtools.list \
    && apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub \
    && apt update \
    && apt install nsight-systems-cli
# Install recipe dependencies
RUN apt update -y && \
    apt install -y python3-pip python3-venv && \
    python3 $(find /opt/nvidia/nsight-systems-cli/ -name nsys_recipe)/install.py --current

# Cleanup
RUN apt clean -y && apt autoclean -y && apt autoremove -y --purge
