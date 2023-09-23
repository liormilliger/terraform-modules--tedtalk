#!/bin/bash

# Install Docker and Docker Compose
apt update -y
apt install docker -y
apt install -y docker.io
apt install docker-compose
# curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose

# Fetch docker-compose.yaml from S3 bucket and perform docker-compose up
aws s3 cp s3://liorm-ted/userdata/docker-compose.yaml ./docker-compose.yaml
aws s3 cp s3://liorm-ted/userdata/nginx.conf ./nginx.conf


# cd /path/to/destination/
# docker compose up --build

# Authenticate Docker to the ECR registry (replace with your AWS region)
aws ecr get-login --no-include-email --region us-east-1

# Pull the Docker images from ECR
docker pull 644435390668.dkr.ecr.us-east-1.amazonaws.com/liorm-ted:latest
docker pull 644435390668.dkr.ecr.us-east-1.amazonaws.com/nginx-img:latest

# Use Docker Compose to start the services defined in the copied docker-compose.yaml file
docker-compose up --build
