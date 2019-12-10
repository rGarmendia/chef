# Webserver File Configuration
file '/var/www/html/index.html' do
  content "This is my chef configured web server file using our first Chef Cookbook default Recipe with Runlist case4\n"
  action :create
end
