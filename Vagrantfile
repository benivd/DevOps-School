# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
$bootstrap = <<SCRIPT
sudo sed -i -f - /etc/apt/sources.list <<EOF
1i\deb mirror://mirrors.ubuntu.com/mirrors.txt precise main restricted universe multiverse \\\\
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-updates main restricted universe multiverse \\\\
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-backports main restricted universe multiverse \\\\
deb mirror://mirrors.ubuntu.com/mirrors.txt precise-security main restricted universe multiverse \\\\
EOF
sudo apt-get -y update 
sudo apt-get -y install default-jdk
sudo apt-get -y install git
cd /vagrant/Hello
git init
cd /vagrant/Hello/result
java HelloRacheli
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "hashicorp/precise64"
	config.vm.provider "virtualbox" do |v|
		v.memory = 1024
		v.cpus = 2
	end 
	config.vm.provision "shell", inline: $bootstrap
  
end
