#!/bin/bash

# Exit when any of these commands fail
set -e

# prebake the Docker containers
docker pull jfrog-docker-reg2.bintray.io/jfrog/artifactory-registry
docker pull node:latest
docker pull node:0.10
docker pull tutum/hello-world:latest
docker pull tutum/haproxy:latest
