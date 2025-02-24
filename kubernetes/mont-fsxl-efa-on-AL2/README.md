## How to FSxL/EFA mount

This test case shows how to mount FSx for Lustre with EFA on Amazon Linux 2 nodes, which has kernel version 5.10.

### Compile lustre client on the nodes

To update the Lustre client on the nodes, you need to create an entrypoint script and a DaemonSet. Follow the steps below:

```
kubectl apply -f fsx-entrypoint.yaml
kubectl apply -f fsx-daemonset.yaml
```