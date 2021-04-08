#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build . --tag=microserviceapi

# Step 2: 
# List docker images
docker image ls
# Step 3: 
# Run flask app
docker run -it --rm --name microservicesapi -p 8000:80 microservicesapi
