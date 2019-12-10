package 'httpd'

#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#end

template '/var/www/html/index.html' do
 source 'index.html.erb'
 notifies :restart, 'service[httpd]', :immediately
end

remote_file '/var/www/html/triforce.png' do
  source 'https://tattoodo-mobile-app.imgix.net/images/posts/20180914_60MHDEEDeJ9fdab.png?w=560&fit=crop&auto=format%2Ccompress'
end 


## Only uses bash to interpretate the commands
#bash "inline script" do
#  user "root"
#  code "mkdir -p /var/www/mysites/ && chown -R apache /var/www/mysistes/"
## not_if '[ -d /var/www/mysites ]'
#  not_if do
#    File.directory?('var/html/mysites/')
#  end
#end

#Looks for whatever the interpreter is, and uses it to achieve the command.
#execute "run a script" do
#  user "root"
#  command <<-EOH
#  mkdir -p /var/www/mysites/ /
#  chown -R apache /var/www/mysites/
#  EOH
#  not_if do
#    File.directory?('var/html/mysites/')
#  end
#end

#execute "run script" do
#  user "root"
#  command './myscript.sh'
#  not_if
#end

#directory "/var/www/mysites" do
#  owner 'apache'
#  recursive true
#end

service 'httpd' do
  action [:enable,:start]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
