#!/bin/zsh

# Defs - initial
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
docker rm -f "mongodb_docker-server_admin_mongodb-1"
docker rm -f "mongodb_docker-server_db_mongodb-1"
docker rm -f "mongodb_docker-mongo-express-1"

# Run
docker-compose up






















































