#
# Cookbook Name:: gor
# Attributes:: default
#
# Author:: Wouter de Vos <wouter@springest.com>
#
# Copyright 2012-2013, Wouter de Vos
#
# See the Readme for details.

default['gor']['role']            = 'listen'            # or 'replay'
default['gor']['listen']['port']  = 80                  # port to listen on for http traffic  
default['gor']['forward']['host'] = node[:ip_address]   # hostname or ip to forward to
default['gor']['replay']['host']  = node[:ip_address]   # hostname or ip to replay on
default['gor']['replay']['port']  = 28020               # port for the replay server

default['gor']['distribution']['repository'] = 'https://github.com/buger/gor.git'
default['gor']['distribution']['reference'] = '3ce0942ab5cd830bc318fa27ebce03b5dadd440c'
