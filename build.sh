#!/usr/bin/env bash

tag=${1:-latest}

echo "Enter your Dockerhub Credentials"
docker login

docker build -f docker/Dockerfile -t \
    audriusbuk/portfolio:$tag .

if [ "$tag" != "latest" ]
    docker tag audriusbuk/portfolio:$tag audriusbuk/portfolio:latest
fi

docker push \
    audriusbuk/portfolio:$tag

echo "Build $tag complete"