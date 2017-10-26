#!/bin/bash

# Exit when any of these commands fail
set -e

# install docker according to https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce
apt-get install -y apt-transport-https ca-certificates curl software-properties-common zip
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# echo 'deb http://download.virtualbox.org/virtualbox/debian xenial contrib' >> /etc/apt/sources.list
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -

apt-get update
apt-get install -y docker-ce
# we don't want to sudo everything
gpasswd -a vagrant docker

# install Jenkins
mkdir -p /home/vagrant/jenkins
wget -O /home/vagrant/jenkins/jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war
chown -R vagrant:vagrant /home/vagrant/jenkins

# install Terraform
wget https://releases.hashicorp.com/terraform/0.10.7/terraform_0.10.7_linux_amd64.zip
mkdir -p /usr/local/terraform/bin
unzip terraform_0.10.7_linux_amd64.zip -d /usr/local/terraform/bin
rm terraform_0.10.7_linux_amd64.zip

# install Packer
wget https://releases.hashicorp.com/packer/1.1.1/packer_1.1.1_linux_amd64.zip
mkdir -p /usr/local/packer/bin
unzip packer_1.1.1_linux_amd64.zip -d /usr/local/packer/bin
rm packer_1.1.1_linux_amd64.zip
# and we need an ISO for Packer to use
# wget http://releases.ubuntu.com/releases/trusty/ubuntu-14.04.5-server-amd64.iso
# chown vagrant:vagrant ubuntu-14.04.5-server-amd64.iso

# setup steps for Artifactory and Jenkins
mkdir -p /var/opt/jfrog/artifactory
mkdir -p /home/vagrant/jenkins_home
chown vagrant:vagrant /home/vagrant/jenkins_home

# install the ChefDK for Chef and InSpec
curl https://omnitruck.chef.io/install.sh | bash -s -- -c stable -P chefdk


# as well as Virtualbox and Vagrant because it is going to get weird aka VM inside the VM
# apt-get install -y virtualbox-5.1
# wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.deb
# dpkg -i vagrant_2.0.0_x86_64.deb
# rm vagrant_2.0.0_x86_64.deb
# and we need a box for Vagrant to use
# wget -O /home/vagrant/xenial-server-32.box https://vagrantcloud.com/ubuntu/boxes/xenial32/versions/20171011.0.0/providers/virtualbox.box
# chown vagrant:vagrant xenial-server-32.box

# install Node.js because it's nice to have around
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

# custom bash setup
echo "export ARTIFACTORY_HOME=/var/opt/jfrog/artifactory" >> /etc/environment
echo "export KITCHEN_YAML=.kitchen.yml" >> /etc/environment
echo "export KITCHEN_LOCAL_YAML=.kitchen.dokken.yml" >> /etc/environment
echo 'eval "$(chef shell-init bash)"' >> /etc/environment
echo "PATH=/home/vagrant/.chefdk/gem/ruby/2.3.0/bin:/usr/local/packer/bin:/usr/local/terraform/bin:$PATH" >> /etc/environment

# install tmux - with screen conf file
apt-get install -y tmux
