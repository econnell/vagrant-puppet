# -*- mode: ruby -*-
# vi: set ft=ruby :


# mode = "standalone"
# mode = "jenkins"
# mode = "docker"
# mode = "instance"

Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: "echo '192.168.33.10 puppet' >> /etc/hosts"

  config.vm.define "puppet_master" do |puppet_master|
    puppet_master.vm.provider "virtualbox" do |v|
      v.memory = 3072
    end
    puppet_master.vm.network :private_network, ip: "192.168.33.10"
    puppet_master.vm.box = "centos-7-vbox-puppet"
    puppet_master.vm.hostname = "puppet.vagrant.envysion.com"
    puppet_master.vm.provision "shell", inline: "echo '*.vagrant.envysion.com' > /etc/puppetlabs/puppet/autosign.conf"
    puppet_master.vm.provision "puppet" do |puppet|
      puppet.environment = "vagrant"
      puppet.environment_path = "code"
      puppet.options = "--verbose"
    end
  end

  config.vm.define "jenkins_master" do |jenkins_master|
    jenkins_master.vm.box = "centos-7-vbox-puppet"
    jenkins_master.vm.network :private_network, ip: "192.168.33.11"
    jenkins_master.vm.hostname = "jenkins-master.vagrant.envysion.com"
    jenkins_master.vm.provision "puppet_server" do |puppet|
      puppet.puppet_node = "jenkins-master.vagrant.envysion.com"
      puppet.options = "--verbose"
    end
  end

  config.vm.define "jenkins_slave" do |jenkins_slave|
    jenkins_slave.vm.box = "centos-7-vbox-puppet"
    jenkins_slave.vm.network :private_network, ip: "192.168.33.12"
    jenkins_slave.vm.hostname = "jenkins-slave.vagrant.envysion.com"
    jenkins_slave.vm.provision "puppet_server" do |puppet|
      puppet.puppet_node = "jenkins-slave.vagrant.envysion.com"
      puppet.options = "--verbose --debug"
    end
  end

#  if defined? mode and not mode.nil? and mode != "standalone" then
#    if (not File.exists?("Vagrantfile." + mode)) then
#      abort("error: specified mode does not exist (Vagrantfile." + mode + ")")
#    else
#      eval(File.read("Vagrantfile." + mode), binding)
#    end
#  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
