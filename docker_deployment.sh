#!/bin/bash

# Define container name
CONTAINER_NAME="flask_app_container"

# Build the Docker image
echo "Building the Docker image..."
docker build -t flask_app_image .

# Check if a container with the same name is already running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping and removing the existing container..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# Run the container
echo "Running the Docker container..."
docker run -d --name $CONTAINER_NAME -v $(pwd)/app.py:/app -p 5050:5050 flask_app_image

echo "Flask app is running in the Docker container on http://localhost:5050"
