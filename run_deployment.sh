#!/usr/bin/env bash

# Step 1:
# Run kubernetes deployment
kubectl apply -f microservice_deployment.yaml

# Step 2
# Add service to deployment
kubectl expose deployment/microserv-deployment --type="NodePort"

# Step 3:
# Enable metrics-server
minikube addons enable metrics-server

# Step 4:
# List all kubernetes resources created
kubectl get all

# After running this set of scripts you should run:

# kubectl autoscale deployment microserv-deployment --cpu-percent=40 --min=1 --max=5

# to create the HPA for the microservice. Check repo's instructions.
