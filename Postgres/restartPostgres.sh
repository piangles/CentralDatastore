#!/bin/bash

# Stop any existing docker_container
docker stop central_ops

# docker image rm central_ops
# Build a new docker image called zuro_ops with the configuration and instructions we defined in Dockerfile
docker image build -t central_ops .

# Start the container : we use the name zuro_ops for it same as the image name.
docker container run -p 5432:5432 --rm -it --name central_ops central_ops