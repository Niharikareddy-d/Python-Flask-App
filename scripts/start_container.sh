#!/bin/bash
set -e

CONTAINER_NAME="danduniharika_simple_python"
IMAGE_NAME="danduniharika30/simple-python-flask-app:latest"

# Stop running container if exists
if docker ps -q -f name="$CONTAINER_NAME" | grep -q .; then
    docker stop "$CONTAINER_NAME"
fi

# Remove stopped container if exists
if docker ps -aq -f name="$CONTAINER_NAME" | grep -q .; then
    docker rm "$CONTAINER_NAME"
fi

# Pull latest image (ignore error if not found)
docker pull "$IMAGE_NAME" || true

# Run container
docker run -d --name "$CONTAINER_NAME" -p 5000:5000 --restart unless-stopped "$IMAGE_NAME"

echo "Container $CONTAINER_NAME started with image $IMAGE_NAME"
