#!/bin/bash

LANG=C

echo ""
echo "Installing Argo CD Operator."

oc apply -k argocd-operator/overlays/std

echo "Pausing for 15 seconds for operator initialization..."

sleep 15

oc rollout status deploy/argocd-operator -n argocd

echo "There should be some CRDs."
oc get crd | grep argo

echo "Deploying Argo CD instance"

oc apply -k argocd/overlays/std

echo "Waiting for Argo CD server to start..."

sleep 15

oc rollout status deploy/argocd-server -n argocd

echo "Argo CD ready!"

echo ""
echo "Printing default admin password:"
oc -n argocd get pod -l "app.kubernetes.io/name=argocd-server" -o jsonpath='{.items[*].metadata.name}'
echo ""
echo ""