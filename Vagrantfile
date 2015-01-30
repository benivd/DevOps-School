# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
$bootstrap = <<SCRIPT
sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install curl
sudo apt-get -y install openjdk-7-jre 
JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export JAVA_HOME
export JRE_HOME
export PATH
cd /vagrant
curl -OL http://downloads.atlassian.com/software/stash/downloads/atlassian-stash-2.0.1.tar.gz
tar xz -C /opt -f atlassian-stash-2.0.1.tar.gz
mkdir stash
STASH_HOME=/vagrant/stash
export STASH_HOME
cd atlassian-stash-2.0.1
bin/start-stash.sh
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "hashicorp/precise64"
	config.vm.provider "virtualbox" do |v|
		v.memory = 1024
		v.cpus = 2
	end 
	config.vm.provision "shell", inline: $bootstrap
  
end
