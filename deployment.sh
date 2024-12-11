#!/bin/bash

set -e

DEPLOY_DIR="$HOME/flask-login-app"

# Create the directory if it doesn't exist
if [ -d "$DEPLOY_DIR" ]; then
    echo "Directory $DEPLOY_DIR already exists. Updating files..."
else
    echo "Creating deployment directory at $DEPLOY_DIR..."
    mkdir -p "$DEPLOY_DIR"
fi

# Copy files to the deployment directory
echo "Copying files to $DEPLOY_DIR..."
mv -r . "$DEPLOY_DIR"

# Navigate to the deployment directory
cd "$DEPLOY_DIR"

# Create and activate the virtual environment
echo "Setting up Python environment..."
python3 -m venv venv
source venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Run the Flask app
echo "Starting the Flask application..."
python3 app.py
