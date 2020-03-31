# GitOps Setup

Install Argo CD Operator `0.0.5` from manifests.

# Setup

1. Login to your cluster with the `oc` cli with a user that has `cluster-admin` rights.
2. Run `./setup.sh`
3. At the end of the setup, the temporary Argo CD password will be printed (name of the main Argo CD pod).

## Default Setup
1. OpenShift OAuth included "out of the box"
2. Custom *PersistentVolumeClaim* health check to allow *Pending* PVCs to be considered healthy.
3. Specify new `ApplicationInstanceLabelKey` that won't mess with `connect-to` annotations.
