#
# Cookbook Name:: gor
# Attributes:: default
#
# Author:: Wouter de Vos <wouter@springest.com>, Peter de Ruijter <edge@springest.com>
#
# Copyright 2012-2013, Wouter de Vos
#

include_recipe "golang::default"


git "~/gor" do
  repository node['gor']['distribution']['repository']
  reference node['gor']['distribution']['revision']
  action :sync
  notifies :run, 'execute[compile-gor-source]', :immediately
  not_if do ::File.exists?("/usr/local/bin/gor") end
end


execute "compile-gor-source" do
  cwd "~/gor"
  command "go build gor.go"
  action :nothing
  notifies :run, 'execute[move-bin-to-folder]', :immediately
end

execute "move-bin-to-folder" do
  cwd "~/gor"
  command "mv ./gor /usr/local/bin/gor"
  action :nothing
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
