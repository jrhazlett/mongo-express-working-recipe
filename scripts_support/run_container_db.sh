#!/bin/zsh

# Defs
USER="root"
PASS="test"

NAME_CONTAINER="server_db_mongodb"
NAME_IMAGE="mongo"

PATH_DIR_MOUNTS="$(pwd)/mounts"
MOUNT_DB="$PATH_DIR_MOUNTS/db:/data/db"
MOUNT_DEV_ARCHIVE="$PATH_DIR_MOUNTS/dev.archive:/Databases/dev.archive"
MOUNT_PROD="$PATH_DIR_MOUNTS/production:/Databases/production"
MOUNT_SCRIPTS_INIT="$PATH_DIR_MOUNTS/scripts_init/:/docker-entrypoint-initdb.d/"

NETWORK="network_mongodb"
PORT="27017:27017"

# Clean-up optional
BOOL_CLEAR_DB=false

# If '-c' is passed as an argument then remove the db directory to ensure a 'clean slate' for this build
while getopts ":c:" opt; do
  case $opt in
    c) BOOL_CLEAR_DB=true
      ;;
    \?) echo "Invalid option -$OPTARG" >&2
      exit 1
      ;;
  esac
  case $OPTARG in
    -*) echo "Option $opt needs a valid argument"
      exit 1
      ;;
  esac
done

if [ $BOOL_CLEAR_DB ]
  then rm -rf mounts/db
fi

# Clean-up
docker rm -f $NAME_CONTAINER

# Build
docker network create -d bridge "$NETWORK"

# Run
docker run \
  -e "MONGO_INITDB_ROOT_USERNAME=$USER" \
  -e "MONGO_INITDB_ROOT_PASSWORD=$PASS" \
  --name $NAME_CONTAINER \
  --network "$NETWORK" \
  -p $PORT \
  -v "$MOUNT_DB" \
  -v "$MOUNT_DEV_ARCHIVE" \
  -v "$MOUNT_PROD" \
  -v "$MOUNT_SCRIPTS_INIT" \
  $NAME_IMAGE




















































