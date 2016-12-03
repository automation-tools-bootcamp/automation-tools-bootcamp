#!/bin/bash

# Exit when any of these commands fail
set -e

# install docker according to https://docs.docker.com/engine/installation/linux/ubuntulinux/
apt-get install -y linux-image-extra-$(uname -r)
apt-get install -y apt-transport-https ca-certificates
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -

echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' | tee /etc/apt/sources.list.d/docker.list
echo 'deb http://download.virtualbox.org/virtualbox/debian trusty contrib' >> /etc/apt/sources.list

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
wget https://releases.hashicorp.com/terraform/0.7.13/terraform_0.7.13_linux_amd64.zip
mkdir -p /usr/local/terraform/bin
unzip terraform_0.7.13_linux_amd64.zip -d /usr/local/terraform/bin

# install Packer
wget https://releases.hashicorp.com/packer/0.12.0/packer_0.12.0_linux_amd64.zip
mkdir -p /usr/local/packer/bin
unzip packer_0.12.0_linux_amd64.zip -d /usr/local/packer/bin

# setup steps for Artifactory and Jenkins
mkdir -p /var/opt/jfrog/artifactory
mkdir -p /home/vagrant/jenkins_home
chown vagrant:vagrant /home/vagrant/jenkins_home

# install the ChefDK for Chef and InSpec
curl https://omnitruck.chef.io/install.sh | bash -s -- -c stable -P chefdk


# as well as Virtualbox and Vagrant because it is going to get weird aka VM inside the VM
# wget http://download.virtualbox.org/virtualbox/5.1.10/virtualbox-5.1_5.1.10-112026~Ubuntu~trusty_amd64.deb
# dpkg -i virtualbox-5.1_5.1.10-112026~Ubuntu~trusty_amd64.deb
apt-get install -y virtualbox-5.1
wget https://releases.hashicorp.com/vagrant/1.9.0/vagrant_1.9.0_x86_64.deb
dpkg -i vagrant_1.9.0_x86_64.deb

# install Node.js because it's nice to have around
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

# custom bash setup
echo "export ARTIFACTORY_HOME=/var/opt/jfrog/artifactory" >> /etc/environment
echo 'eval "$(chef shell-init bash)"' >> /etc/environment
echo "PATH=/home/vagrant/.chefdk/gem/ruby/2.3.0/bin:/usr/local/packer/bin:/usr/local/terraform/bin:$PATH" >> /etc/environment

# install tmux - with screen conf file
apt-get install -y tmux
