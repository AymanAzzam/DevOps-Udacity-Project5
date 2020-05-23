#!/bin/sh

DNS_Name=$1

# Build the Docker Image
docker build --tag todo-app .

# Run The Container in the background
docker run -p 1024:1024 --hostname $DNS_Name -d todo-app
