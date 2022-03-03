#!/bin/bash

CONTAINER='nginx-proxy'
NETWORK_NAME=${NETWORK_NAME:-$(basename $PWD)_default}
[[ $(docker ps -f "name=$CONTAINER" --format '{{.Names}}') == $CONTAINER ]]
CONTAINER_RUNNING=$?
[[ $(docker ps -af "name=$CONTAINER" --format '{{.Names}}') == $CONTAINER ]]
CONTAINER_EXISTS=$?

function connectNetwork {
  if [[ $(docker inspect nginx-proxy -f "{{index .NetworkSettings.Networks \"$NETWORK_NAME\"}}") == "<nil>" ]]; then
    docker network connect $NETWORK_NAME nginx-proxy
  fi
}

if [[ "$1" == "-s" && $CONTAINER_EXISTS ]]; then
  echo "Stopping container"
  docker stop $CONTAINER

  exit 0
fi

if [[ $CONTAINER_RUNNING == 0 ]]; then
  echo "Starting container"
  connectNetwork # Makes sure if we are running this in another project, that we always connect the networks

  exit 0
elif [[ $CONTAINER_EXISTS == 0 ]]; then
  echo "Starting container"
  docker start $CONTAINER
  connectNetwork

  exit 0
fi

echo "Creating container"
docker run -d -p 80:80 -v "${PWD}/docker/nginx-proxy.conf":/etc/nginx/conf.d/nginx-proxy.conf -v /var/run/docker.sock:/tmp/docker.sock:ro --name $CONTAINER jwilder/nginx-proxy:alpine
connectNetwork
