# CP-Ansible playground

A way of messing around with cp-ansible using local docker containers

## Introduction

We often recommend the use of [cp-ansible](https://github.com/confluentinc/cp-ansible) for creating Confluent Platform environments.
It contains a testing framework called Molecule (see [here](https://github.com/confluentinc/cp-ansible/blob/6.1.0-post/HOW_TO_TEST.md)) and we provide a large number of pre-configured configurations in [roles/confluent.test/molecule](https://github.com/confluentinc/cp-ansible/tree/6.1.0-post/roles/confluent.test/molecule)

This works great, but it mixes the inventory into the middle of a larger molecule.yml file.
Often if someone gives you a hosts.yml file and needs help in figuring out why it doesn't work it would be nice to just take that file as is and run **cp-ansible** to deploy it onto some inventory.

This project uses docker-compose to create that inventory as a bunch of local docker containers running centos7.

## Getting started

First grab a copy of cp-ansible into the directory where you put this stuff
````
git clone https://github.com/confluentinc/cp-ansible.git
````

## Prepare the inventory

Assuming someone has given you a hosts.yml file, or you have created your own one - this defines how you want Confluent Platform to be deployed across a bunch of machines. These machines are the *inventory*.

Make sure you have as many instances of *ansible_target* in the *docker-compose.yml* as there are unique hosts in the hosts.yml file, and set the hostnames to those seen in the hosts.yml file. Also update *fix_known_hosts.sh* to match the list of host names.

Start the inventory (the first time around you should see it build your container images) and then exec into the 'ansible' one.
````
docker-compose up -d
docker-compose  exec ansible /bin/bash
````

## Run your playbooks!

Now you need to grab some public keys from the target machines
````
cd /data
./fix_known_hosts.sh
````
Now you can run the playbooks
````
cd /data/cp-ansible
ansible-playbook -i ../hosts_minimum_1.yml all.yml
````
You can deploy and re-deploy to your heart's content and run whatever tests you need to check the cluster works correctly.

## Cleaning up

When you're finished clean up with
````
docker-compose down -v --rmi all --remove-orphans
````
