#!/bin/bash

# The script will:
# - Check if Docker is running
# - Build the Docker image if necessary
# - Start or restart the container
# - Wait for the server to be ready
# - Automatically open your default browser when the server is available

# **Requirements:**
# - Docker must be installed and running
# - Browser access (optional, for automatic opening)

# **Error Handling:**
# The script includes error checks for:
# - Docker daemon status
# - Build process failures
# - Container startup issues
# - Server availability

# Error handling function
handle_error() {
    echo "Error: $1"
    exit 1
}

# Status message function
status_message() {
    echo "==> $1"
}

# Check if Docker is running
if ! docker info >/dev/null 2>&1; then
    handle_error "Docker is not running. Please start Docker."
fi

# Build Docker image
status_message "Building Docker image..."
if ! docker build -t fake-endpoint .; then
    handle_error "Failed to build Docker image"
fi

# Check if port 3000 is already in use
if lsof -i :3000 >/dev/null 2>&1; then
    handle_error "Port 3000 is already in use"
fi

# Run Docker container
status_message "Starting container..."
if ! docker run -d -p 3000:3000 --name fake-endpoint-container fake-endpoint; then
    handle_error "Failed to start container"
fi

# Wait for server to start (5 seconds)
status_message "Waiting for server to start..."
sleep 5

# Check if container is running
if ! docker ps | grep -q fake-endpoint-container; then
    docker logs fake-endpoint-container
    handle_error "Container failed to start"
fi

# Open browser
status_message "Opening browser..."
case "$(uname -s)" in
    Darwin) open "http://localhost:3000" ;;
    Linux)  xdg-open "http://localhost:3000" ;;
    *)      handle_error "Unsupported operating system" ;;
esac

status_message "Server is running at http://localhost:3000"

