#!/bin/bash

set -e

echo "[BeforeInstall] Starting pre-installation steps..."

# Update system packages (optional)
# echo "[BeforeInstall] Updating packages"
# sudo apt-get update -y

# Install kubectl if not already installed (optional)
if ! command -v kubectl &> /dev/null; then
  echo "[BeforeInstall] Installing kubectl..."
  curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.3/2023-11-10/bin/linux/amd64/kubectl
  chmod +x ./kubectl
  mv ./kubectl /usr/local/bin/
else
  echo "[BeforeInstall] kubectl is already installed"
fi

# Configure kubeconfig to connect to EKS
echo "[BeforeInstall] Setting up kubeconfig"
aws eks update-kubeconfig --region ap-south-1 --name ashok-cluster18
echo "[BeforeInstall] kubeconfig configured successfully"

# Clean old deployment files (optional)
# echo "[BeforeInstall] Cleaning up old /app directory"
# rm -rf /app

echo "[BeforeInstall] Pre-install steps completed."
