#!/bin/zsh

# Defs
USER="root"
PASS="test"

NAME_CONTAINER="server_admin_mongodb"
NAME_IMAGE="mongo-express"

NAME_SERVER="server_db_mongodb"
NETWORK="network_mongodb"
PORT="8081:8081"

# Clean-up
docker rm -f $NAME_CONTAINER

# Build
docker network create -d bridge "$NETWORK"

# Run
docker run \
  -e "ME_CONFIG_BASICAUTH_USERNAME=$USER" \
  -e "ME_CONFIG_BASICAUTH_PASSWORD=$PASS" \
  -e "ME_CONFIG_MONGODB_SERVER=$NAME_SERVER" \
  -e "ME_CONFIG_MONGODB_ADMINUSERNAME=$USER" \
  -e "ME_CONFIG_MONGODB_ADMINPASSWORD=$PASS" \
  --name $NAME_CONTAINER \
  --network "$NETWORK" \
  -p $PORT \
  $NAME_IMAGE






























































