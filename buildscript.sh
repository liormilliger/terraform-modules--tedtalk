#!/bin/bash
apt update -y
apt install docker -y
apt install -y docker.io
apt install docker-compose
#### SORT OUT THE DOCKERFILES LIBRARIES!!!!
cat <<EOL > Dockerfile
FROM maven:3.6.3-jdk-8
WORKDIR /app
COPY . /app
WORKDIR /app/target
COPY application.properties /app/target
EXPOSE 9191
CMD ["java", "-jar", "embedash-1.1-SNAPSHOT.jar", "--spring.config.location=./application.properties"]
EOL

cat <<EOL > Dockerfile.nginx
FROM maven:3.6.3-jdk-8
WORKDIR /app
COPY . /app
WORKDIR /app/target
COPY application.properties /app/target
EXPOSE 9191
CMD ["java", "-jar", "embedash-1.1-SNAPSHOT.jar", "--spring.config.location=./application.properties"]
EOL

cat <<EOL > docker-compose.yaml
version: '3'

services:
  tedsearch:
    image: ted-search
    networks:
      - ubuntu_jenkins_network

  nginx:
    build:
      context: .
      dockerfile: Dockerfile.nginx
    ports:
      - "80:80"
    depends_on:
      - tedsearch
    networks:
      - ubuntu_jenkins_network
  
  memcached:
    image: memcached:latest
    networks:
      - ubuntu_jenkins_network

networks:
  ubuntu_jenkins_network:

    
EOL

