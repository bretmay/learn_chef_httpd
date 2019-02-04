apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

package 'tree'
package 'python'
package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

group 'web_admin'

user 'web_admin' do
  group 'web_admin'
  system true
  shell '/bin/bash'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0644'
  owner 'web_admin'
  group 'web_admin'
end
#
# Cookbook:: learn_chef_httpd
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
