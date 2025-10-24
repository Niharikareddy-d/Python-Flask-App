#!/bin/bash
set -e

CONTAINER_NAME="danduniharika_simple_python"

if docker ps -q -f name="$CONTAINER_NAME" | grep -q .; then
    docker stop "$CONTAINER_NAME"
    docker rm "$CONTAINER_NAME"
    echo "Stopped and removed $CONTAINER_NAME"
else
    echo "No running container named $CONTAINER_NAME"
fi
