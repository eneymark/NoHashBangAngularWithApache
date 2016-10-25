#
# Cookbook Name:: apache-htaccess
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#apache
#replace httpconf for enabling .htaccess
execute 'replace in httpd.conf file' do
  user 'root'
  command 'sed -i \'/<Directory "\/var\/www\/html">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/\' /home/vagrant/httpd.conf'
end

#copy htaccess file into apache
cookbook_file ['httpdvar-path'] do
  source '.htaccess'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

