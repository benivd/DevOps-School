# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
$bootstrap = <<SCRIPT
PATH=$PATH:/vagrant
export PATH
cd /vagrant
atlassian_stash_up.sh
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "hashicorp/precise64"
	config.vm.provider "virtualbox" do |v|
		v.memory = 1024
		v.cpus = 2
	end 
	config.vm.provision "shell", inline: $bootstrap
  
end
