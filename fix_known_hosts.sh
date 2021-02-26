#!/bin/bash

# This is the list of target hosts that were created by the docker-compose
# In order for password-less ssh login to work we need to grab their public keys
# into the known_hosts file
rm -f ~/.ssh/known_hosts
ssh-keyscan ya4533.local.net >> ~/.ssh/known_hosts
ssh-keyscan ya4534.local.net >> ~/.ssh/known_hosts
ssh-keyscan ya4535.local.net >> ~/.ssh/known_hosts