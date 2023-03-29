# Mongodb Docker

This is a working example of a mongodb + mongo-express container setup.

## How to run...

You can do 'docker-compose up' and that will work fine.

In addition to that option, I also added...
run_docker_compose.sh

This does the same thing, except it clears out previous containers first (which compose isn't reliable on),
and if you run it with the '-c' option, it will purge the mounts/db directory. This is helpful for debugging.

Example:<br>
sh run_docker_compose.sh -c

Starting up the containers, you can navigate to the login portal:
http://localhost:8081

The default login is:
root / test

## Overview on directories

### mounts/

This consists of mount points for the database

mounts/db: This is where the actual mongo files will go

mounts/scripts_init: This contains a script that runs upon initialization. This creates a default
admin account for the db.

### scripts_support/

These are scripts for managing individual containers.

Notes: 
- run_container_admin.sh will crash if its unable to reach the db.
- 'sh run_container_db.sh -c' will delete mounts/db ahead of the build to wipe out user account data.

### docker-compose.yml

This is the ordered yml file for running docker-compose

### run_docker_compose.sh

This script is essentially the same as running 'docker-compose up' with an added feature:

'sh run_docker_compose.sh -c': Running this command with delete mounts/db ahead of initializing
the containers. This ensures any previous account data is also wiped out.






















































