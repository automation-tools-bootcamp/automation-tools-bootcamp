#!/bin/bash

# Exit when any of these commands fail
set -e

# Use bash in Ubuntu (default is dash)
dpkg-reconfigure bash

# Install necessary libraries for guest additions and VMware HGFS shares
apt-get -y install linux-headers-server build-essential dkms nfs-common

# Install wget (this is used in other provision scripts)
apt-get -y install wget curl unzip gzip
