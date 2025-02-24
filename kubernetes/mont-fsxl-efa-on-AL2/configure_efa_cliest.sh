#!/usr/bin/env bash

set -euxo pipefail

eth_intf="$(ip -br -4 a sh | grep eth1 | awk '{print $3}')"
efa_version=$(modinfo efa | awk '/^version:/ {print $2}' | sed 's/[^0-9.]//g')
min_efa_version="2.12.1"

# Check the EFA driver version. Minimum v2.12.1 supported
if [[ -z "$efa_version" ]]; then
    echo "Error: EFA driver not found"
    exit 1
fi

if [[ "$(printf '%s\n' "$min_efa_version" "$efa_version" | sort -V | head -n1)" != "$min_efa_version" ]]; then
    echo "Error: EFA driver version $efa_version does not meet the minimum requirement $min_efa_version"
    exit 1
else
    echo "Using EFA driver version $efa_version"
fi

echo "Loading Lustre/EFA modules..."
/sbin/modprobe lnet
/sbin/modprobe kefalnd ipif_name="$eth_intf"
/sbin/modprobe ksocklnd
lnetctl lnet configure