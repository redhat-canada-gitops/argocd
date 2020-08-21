#!/bin/bash

LANG=C
SLEEP_SECONDS=45

echo ""
echo "Installing Argo CD Operator."

oc apply -k argocd-operator/overlays/default

echo "Pause $SLEEP_SECONDS seconds for the creation and approval of the InstallPlan."
sleep $SLEEP_SECONDS

oc rollout status deploy/argocd-operator -n argocd

echo "Listing Argo CD CRDs."
oc get crd | grep argo


echo "Deploying Argo CD instance"

oc apply -k argocd/overlays/default

echo "Waiting for Argo CD server to start..."

sleep $SLEEP_SECONDS

oc rollout status deploy/argocd-server -n argocd

echo "Argo CD ready!"