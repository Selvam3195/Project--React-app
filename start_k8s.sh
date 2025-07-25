#!/bin/bash

set -e

echo "[ApplicationStart] Starting Kubernetes deployment..."

# Check Kubernetes access
if ! kubectl get nodes; then
  echo "[ApplicationStart] ERROR: Unable to connect to EKS cluster."
  exit 1
fi

# Apply Kubernetes manifests
echo "[ApplicationStart] Applying Kubernetes manifests..."
kubectl apply -f deployment.yaml

# Wait for the deployment rollout
echo "[ApplicationStart] Waiting for rollout to complete..."
kubectl rollout status deployment/my-app --timeout=120s

echo "[ApplicationStart] Kubernetes application started successfully."
