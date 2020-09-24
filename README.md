# Argo CD Setup

Install Argo CD Operator `0.0.13` from manifests.

# Setup

1. Login to your cluster with the `oc` cli with a user that has `cluster-admin` rights.
2. Run `./setup.sh`

# Without the Script

If you look at `setup.sh`, you'll see there are only two imporant `oc` commands.  You can run these manually.
1. `oc apply -k argocd-operator/overlays/default`
2. Wait for the Argo CD Operator to finish installing.
3. `oc apply -k argocd/overlays/default`

Done!

## Default Setup
1. OpenShift OAuth included "out of the box"
2. Custom *PersistentVolumeClaim* health check to allow *Pending* PVCs to be considered healthy.
3. Specify new `ApplicationInstanceLabelKey` that won't mess with `connect-to` annotations.
