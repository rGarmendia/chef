# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
user 'testuser' do
  action :create
end
include_recipe 'ntpserver::default'
include_recipe 'webserver::apachepkg'
include_recipe 'webserver::apachefile'
include_recipe 'webserver::apacheservice'
