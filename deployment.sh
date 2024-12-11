#!/bin/bash

set -e

DEPLOY_DIR="$HOME/Flask_login_deploy"

if [ -d "$DEPLOY_DIR" ]; then
    echo "Directory $DEPLOY_DIR already exists. Updating files..."
else
    echo "Creating deployment directory at $DEPLOY_DIR..."
    mkdir -p "$DEPLOY_DIR"
fi

echo "Copying files to $DEPLOY_DIR..."
cp -r . "$DEPLOY_DIR"

cd "$DEPLOY_DIR"

echo "Setting up Python environment..."
python3 -m venv venv
source venv/bin/activate

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Starting the Flask application..."
flask run --host=0.0.0.0 --port=5000
