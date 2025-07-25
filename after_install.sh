#!/bin/bash

set -e

echo "[AfterInstall] Running post-installation steps..."

# Example: Change permissions on application files
echo "[AfterInstall] Setting permissions for /app directory"
chmod -R 755 /app

# Example: Make sure kubectl is configured to talk to the cluster
echo "[AfterInstall] Verifying Kubernetes config"
if ! kubectl get nodes; then
  echo "[AfterInstall] ERROR: Unable to connect to EKS cluster."
  exit 1
fi

# Example: Validate manifest file presence
if [ ! -f /app/manifest/deployment.yaml ]; then
  echo "[AfterInstall] ERROR: Kubernetes manifest not found."
  exit 1
fi

echo "[AfterInstall] Post-install steps completed successfully."
