#!/usr/bin/env bash

# this script will be executed as root
# so using ~ would be /root not /home/vagrant

# trick learned to have this run only once unless the VM is destroyed
# source: https://github.com/mitchellh/vagrant/issues/1311
test -f /etc/bootstrapped && exit

# webserver please
sudo apt-get update
sudo apt-get install -y apache2
# I dislike dealing with Firewall issues in dev - turn them off
iptables -F

# log the date in to the bootstrapped file to track that is script has been run one time
date > /etc/bootstrapped
