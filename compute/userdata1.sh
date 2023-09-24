#!/bin/bash

# Install services
apt-get update && apt-get upgrade -y
apt-get install docker -y
apt-get install -y docker.io
apt-get install docker-compose -y

snap install aws-cli --classic
usermod -aG docker ubuntu

sudo -iu ubuntu << EOF
#Copying files from s3
aws s3 cp s3://liorm-ted/userdata/docker-compose.yaml ./docker-compose.yaml
aws s3 cp s3://liorm-ted/userdata/nginx.conf ./nginx.conf

# Fetching images 
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 644435390668.dkr.ecr.us-east-1.amazonaws.com 

docker pull 644435390668.dkr.ecr.us-east-1.amazonaws.com/liorm-ted:ted-search
docker pull 644435390668.dkr.ecr.us-east-1.amazonaws.com/liorm-ted:nginx-img

docker pull ubuntu/memcached

docker-compose up 
EOF

