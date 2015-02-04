#!/bin/sh

sudo apt-get update
sudo apt-get -y install software-properties-common python-software-properties
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y install git

sudo groupadd git
sudo useradd -m -s /bin/bash -g git git
echo git:git | sudo chpasswd

sudo su -c "cd ~git && mkdir .ssh && chmod 700 .ssh" git
sudo su -c "cd ~git && touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys" git
sudo su -c "cd ~git && cat /vagrant/keys/github_rsa.pub  >> .ssh/authorized_keys" git

chown -R git:git ~git

exit 0