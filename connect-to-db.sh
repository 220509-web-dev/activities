#!/bin/bash

containerName=$1
dbUsername=$2

# -z string: True if the length of string is zero.
if [ -z $containerName ] || [ -z $dbUsername ]; then
  docker exec -it Sigg-db psql -U postgres
# This script was not working for me, so I made adjustments. SEE BELOW EXPLANATION
     # The original scirpt caused for the following two lines to be here. It was not working,
     # so I made them both comments and added the docker line above.
# echo "Invalid usage. Expected usage: $0 [container-name] [db-username]"
# echo "Example: $0 local-db postgres"
exit 1
fi

isRunning=$(./is-this-thing-on.sh $containerName)
if [ $isRunning -eq 0 ]; then
  echo "Cannot connect to container with name, $containerName. Container is not running."
  echo "Start the container by running: docker start $containerName"
  exit 1
else
  docker exec -it $containerName psql -U $dbUsername
fi
