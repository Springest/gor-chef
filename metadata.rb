#
# Cookbook Name:: gor
# Attributes:: default
#
# Author:: Wouter de Vos <wouter@springest.com>
#
# Copyright 2012-2013, Wouter de Vos
#
maintainer       "Wouter de Vos | Springest"
maintainer_email "wouter@springest.com"
license          "MIT"
description      "Installs Gor listener and Gor replayer"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

provides "gor"
recipe   "gor",  "Install the Gor binaries."
