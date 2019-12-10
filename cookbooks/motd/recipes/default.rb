#
# Cookbook:: motd
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
# Creation simple motd file for Linux Server
file '/etc/motd' do
  content "This is a sample message of the day file created using Chef Automation\n"
  action :create
end
