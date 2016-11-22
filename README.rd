# Getting Started

## Install Vagrant if you have not already:

https://www.vagrantup.com/downloads.html

## Install VirtualBox:

https://www.virtualbox.org/wiki/Downloads

## Install r10k:

gem install r10k

## Build a Vagrant box:

cd centos7

./build.sh

vagrant add centos-7-vbox-puppet.box --name centos-7-vbox-puppet

## Launch vagrant puppet master and client

From this repo's root directory:

vagrant up
