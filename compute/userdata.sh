#!/bin/bash
sudo apt update
sudo apt install docker -y
sudo apt install docker.io -y
sudo apt update
docker pull adongy/hostname-docker
docker run -d --name app -p 80:3000 adongy/hostname-docker .