#
# Cookbook Name:: gor
# Attributes:: default
#
# Author:: Wouter de Vos <wouter@springest.com>
#
# Copyright 2012-2013, Wouter de Vos
#
cookbook_file '/usr/local/bin/gor' do
  source 'gor-linux-amd64'
  owner 'root'
  mode 0744
  action :create
  only_if( "uname -m | grep x86_64" )
end

cookbook_file '/usr/local/bin/gor' do
  source 'gor-linux-i386'
  owner 'root'
  mode 0744
  action :create
  not_if( "uname -m | grep x86_64" )
end

template '/usr/local/bin/gor_listen' do
  source 'gor_do.erb'
  owner 'root'
  mode 0744
  action :create
  only_if( node['gor']['role'] == 'listen' )
end

template '/usr/local/bin/gor_play' do
  source 'gor_do.erb'
  owner 'root'
  mode 0744
  action :create
  only_if( node['gor']['role'] == 'play' )
end