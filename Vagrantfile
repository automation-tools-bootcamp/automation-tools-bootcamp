# -*- mode: ruby -*-
# vi: set ft=ruby :

# ########################################################
#
# THIS FILE EXISTS TO QUICKLY SPIN UP AND TEST CREATED BOX
#
# ########################################################


# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # If you're on a decent Internet connection download the box from Hashicorp
  config.vm.box = "automationtools/atb-lisa-2017"
  # config.vm.box = "atb-lisa-2017"
  # config.vm.box_url = "./boxes/atb-lisa-2017-1.0.0_vbox.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 80, auto_correct: true
  config.vm.network "forwarded_port", guest: 443, host: 443, auto_correct: true
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true
  config.vm.network "forwarded_port", guest: 5000, host: 5000, auto_correct: true
  config.vm.network "forwarded_port", guest: 5001, host: 5001, auto_correct: true
  config.vm.network "forwarded_port", guest: 5002, host: 5002, auto_correct: true
  config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest: 8081, host: 8081, auto_correct: true
  config.vm.network "forwarded_port", guest: 8082, host: 8082, auto_correct: true
  config.vm.network "forwarded_port", guest: 8083, host: 8083, auto_correct: true
  config.vm.network "forwarded_port", guest: 8084, host: 8084, auto_correct: true
  config.vm.network "forwarded_port", guest: 8085, host: 8085, auto_correct: true
  config.vm.network "forwarded_port", guest: 8086, host: 8086, auto_correct: true
  config.vm.network "forwarded_port", guest: 8087, host: 8087, auto_correct: true
  config.vm.network "forwarded_port", guest: 8088, host: 8088, auto_correct: true
  config.vm.network "forwarded_port", guest: 8089, host: 8089, auto_correct: true
  config.vm.network "forwarded_port", guest: 8443, host: 8443, auto_correct: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
end
