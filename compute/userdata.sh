#!/bin/bash

# Install Docker and Docker Compose
apt-get update -y
apt-get install -y docker.io
# curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose

# Fetch docker-compose.yaml from S3 bucket and perform docker-compose up
aws s3 cp s3://liorm-ted/userdata/docker-compose.yaml ./
# cd /path/to/destination/
docker compose up --build
