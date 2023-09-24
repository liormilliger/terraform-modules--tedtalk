#!/bin/bash

# Install services
apt update -y
apt upgrade -y
apt install docker -y
apt install -y docker.io
apt install docker-compose -y
apt install awscli -y

usermod -aG docker ubuntu

#Copying files from s3
aws s3 cp s3://liorm-ted/userdata/docker-compose.yaml ./docker-compose.yaml
aws s3 cp s3://liorm-ted/userdata/nginx.conf ./nginx.conf

# Fetching images 
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 644435390668.dkr.ecr.us-east-1.amazonaws.com | docker pull 644435390668.dkr.ecr.us-east-1.amazonaws.com/liorm-ted:ted-search
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 644435390668.dkr.ecr.us-east-1.amazonaws.com | docker pull 644435390668.dkr.ecr.us-east-1.amazonaws.com/liorm-ted:nginx-img
docker pull ubuntu/memcached

# # Use Docker Compose to start the services defined in the copied docker-compose.yaml file
# docker-compose up --build
