#!/bin/bash

set -e

echo "[ValidateService] Validating Kubernetes deployment..."

# Check if pods are running
echo "[ValidateService] Checking pod status..."
kubectl get pods -l app=my-app

# Wait until all pods are ready
READY_REPLICAS=$(kubectl get deployment my-app -o jsonpath='{.status.readyReplicas}')
DESIRED_REPLICAS=$(kubectl get deployment my-app -o jsonpath='{.spec.replicas}')

if [[ "$READY_REPLICAS" == "$DESIRED_REPLICAS" ]]; then
  echo "[ValidateService] All $READY_REPLICAS/$DESIRED_REPLICAS pods are ready."
else
  echo "[ValidateService] ERROR: Only $READY_REPLICAS/$DESIRED_REPLICAS pods are ready."
  exit 1
fi

# Optionally, test HTTP response if using a LoadBalancer or ClusterIP
# echo "[ValidateService] Curling service endpoint..."
# curl --fail http://<your-service-endpoint>/health || {
#   echo "[ValidateService] ERROR: Health check failed."
#   exit 1
# }

echo "[ValidateService]
