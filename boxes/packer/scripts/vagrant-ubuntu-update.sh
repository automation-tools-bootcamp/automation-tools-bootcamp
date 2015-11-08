#!/bin/bash

# Exit when any of these commands fail
set -e

# Update all existing packages
apt-get -y update
apt-get -y upgrade

# Reboot
reboot

# Sleep a while...
sleep 60
