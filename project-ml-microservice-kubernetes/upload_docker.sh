#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=amirasoliman89/microserviceapi
export dockerpath="amirasoliman89/microserviceapi:microserviceapi"

# Step 2:  
# Authenticate & tag
docker login --username amirasoliman89  --password amirasoliman89
docker tag microserviceapi amirasoliman89/microserviceapi:microserviceapi
echo "Docker ID and Image: $dockerpath" 

# Step 3:
# Push image to a docker repository
#docker push $dockerpath
docker push  amirasoliman89/microserviceapi:microserviceapi
