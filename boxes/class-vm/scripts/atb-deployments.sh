#!/bin/bash

# Exit when any of these commands fail
set -e

# install docker according to https://docs.docker.com/engine/installation/linux/ubuntulinux/
apt-get install -y linux-image-extra-$(uname -r)
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D


echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' | tee /etc/apt/sources.list.d/docker.list

apt-get update
apt-cache policy docker-engine

apt-get update
apt-get install -y docker-engine

# install Jenkins
apt-get install -y default-jdk
mkdir -p /home/vagrant/jenkins
wget -O /home/vagrant/jenkins/jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war
chown -R vagrant:vagrant /home/vagrant/jenkins

# install Terraform
wget https://releases.hashicorp.com/terraform/0.6.12/terraform_0.6.12_linux_amd64.zip
mkdir -p /usr/local/terraform/bin
unzip terraform_0.6.12_linux_amd64.zip -d /usr/local/terraform/bin

# setup steps for Artifactory and Jenkins
mkdir -p /var/opt/jfrog/artifactory
mkdir -p /home/vagrant/jenkins_home
chown vagrant:vagrant /home/vagrant/jenkins_home

# install the ChefDK for InSpec
curl https://omnitruck.chef.io/install.sh | bash -s -- -c current -P chefdk

# install Node.js because it's nice to have around
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

# custom bash setup
echo "export ARTIFACTORY_HOME=/var/opt/jfrog/artifactory" >> /etc/environment
echo "PATH=/usr/local/terraform/bin:$PATH" >> /etc/environment
echo 'eval "$(chef shell-init bash)"' >> /etc/environment

# install tmux - with screen conf file
apt-get install -y tmux
