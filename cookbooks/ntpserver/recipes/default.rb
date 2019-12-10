#
# Cookbook:: ntpserver
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
include_recipe 'ntpserver::ntppkg'
include_recipe 'ntpserver::ntpfile'
include_recipe 'ntpserver::ntpservice'
