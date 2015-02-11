# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "hashicorp/precise64"
	config.vm.network :forwarded_port, guest: 7990, host: 7990
	config.vm.network :forwarded_port, guest: 8080, host: 8080
    config.vm.network :private_network, ip: "192.168.35.15"
	
	config.vm.provider "virtualbox" do |v|
		v.memory = 1024
		v.cpus = 2
	end 
	config.vm.provision "shell", path: "deployStash.sh"
  
end
