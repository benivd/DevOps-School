# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$script = <<SCRIPT
#sudo apt-get -y update 
#comment
#number
#another change
echo I am provisioning...
sudo apt-get install -y git
sudo apt-get install -y tomcat
##################
#mkdir GitTest
#cd GitTest1
#remote add origin https://github.com/shaybonar/GitTest1.git
#git init
#vi README1.txt
#i
#This is the first  read me
#:wq
#git add README1 
#git commit  -m 'First commit'
#password? 
#username?
#git push origin master
###################
#sudo apt-get install -y firefox 
#sudo apt-add-repository	-y ppa:mozillateam/firefox-next
#sudo apt-get upgrade 
SCRIPT



Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.provision "shell", inline: $script
end
