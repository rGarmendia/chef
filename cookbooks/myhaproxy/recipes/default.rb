
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
# Just a comment!

#node.default['haproxy']['members'] = [
#	{
#		"hostname" => 'gco-web-1',
#		"ipaddress"=> '10.128.0.2',
#		"port"     => 80,
#		"ssl_port" => 80
#	}
#]
#
#include_recipe "haproxy::manual"

haproxy_install 'package'

haproxy_frontend 'http-in' do
  bind '*:80'
  default_backend 'servers'
end

# search('index','seach:pattern')
# Indexes: client, node, role, environment, data bag


all_web_nodes = search('node', "role:web AND chef_environment:#{node.chef_environment}")

servers = []

all_web_nodes.each do |web_node|
  server = "#{web_node['hostname']} #{web_node['ipaddress']}:80 maxconn 32"
  servers.push(server)
end

haproxy_backend 'servers' do
  server servers
end

# haproxy_backend 'servers' do
#   server [
#   	'gcp-web-1 10.128.0.2:80 maxconn 32',
#   	'gcp-web-2 10.128.0.6:80 maxconn 32',
#         ]
#   #notifies :reload, 'haproxy_service[haproxy]', :immediately
# end

haproxy_service 'haproxy' do
  subscribes :reload, 'template[/etc/haproxy/haproxy.cfg]', :immediately
end
