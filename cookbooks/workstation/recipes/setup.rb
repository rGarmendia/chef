package 'vim-enhanced'

package 'emacs'

package 'git'

package 'ntp' do
  action :install
end

package 'tree'

template 'etc/motd' do
  source 'motd.erb'
  variables(
    :name => 'Ricardo Garmendia'
  )
  action :create
end

user 'user1' do
  comment 'user1'
  uid '123'
  home '/home/user1'
  shell '/bin/bash'
end

group 'admins' do
  members 'user1'
end
