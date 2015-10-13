#!/bin/bash

# Exit when any of these commands fail
set -e

# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin vagrant
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
