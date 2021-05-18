#!/bin/bash

# This is the list of target hosts that were created by the docker-compose
# In order for password-less ssh login to work we need to grab their public keys
# into the known_hosts file
rm -f ~/.ssh/known_hosts

if [ "$1" ]; then
  COMPOSE_FILE="$1"
else
  COMPOSE_FILE=docker-compose.yml
fi
cat $COMPOSE_FILE | grep hostname | grep -v "#" | grep -v "ansible" | cut -d ":" -f 2 | while read -r host ; do
  echo "Adding $host"
  ssh-keyscan $host >> ~/.ssh/known_hosts
done