#
# Cookbook Name:: automation-tools
# Recipe:: default
#
# Copyright (c) 2015 Tyler Fitch (github@tylerfitch.com), All Rights Reserved.

# I think this is required now because older dependencies being pulled because of Ghost
# so you get it for free to move you forward
execute 'apt-get update' do
	action :run
end

# your installation of Apache2 goes here
package 'apache2' do
	action :install
end