#!/bin/bash

# https://www.jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm/

docker network create jenkins
docker volume create jenkins-docker-certs
docker volume create jenkins-data

docker container run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 docker:dind
docker container run --name jenkins-blueocean --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  --publish 8080:8080 --publish 50000:50000 jenkinsci/blueocean

docker build -t myjenkins-blueocean:1.1 ./build/Jenkins/
