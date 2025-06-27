#!/bin/bash

CONTAINER_NAME=toy-imitation

# Check if container is running
if docker ps -f name=$CONTAINER_NAME --format '{{.Names}}' | grep -q "$CONTAINER_NAME"; then
    echo "🔁 Attaching to container '$CONTAINER_NAME'..."
    docker exec -it $CONTAINER_NAME bash
else
    echo "❌ Container '$CONTAINER_NAME' is not running."
    echo "👉 Run './start.sh' first to start it."
fi