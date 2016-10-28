#!/bin/bash

set -euxo pipefail

# Make sure a Vagrantfile exists so we don't accidentally traverse parent
# directories
touch Vagrantfile
vagrant destroy -f
rm -f centos-7-vbox-puppet.box

# This will update all packages to the latest release (including the kernel).
# Update and reboot in case there has been a kernel update
cp Vagrantfile.initialize Vagrantfile
vagrant up
vagrant reload
cp Vagrantfile.vboxpuppet Vagrantfile
vagrant provision
vagrant halt
vagrant package --output centos-7-vbox-puppet.box
vagrant destroy -f
> Vagrantfile
echo
echo "To add this to your box list: vagrant add centos-7-vbox-puppet.box"
