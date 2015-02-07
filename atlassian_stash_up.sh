#!/bin/bash
sudo apt-get update
sudo apt-get -y install curl
sudo apt-get -y install openjdk-7-jre 
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get -y install git
JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export JAVA_HOME
export JRE_HOME
export PATH
cd /vagrant
curl -OL http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-3.6.1.tar.gz
tar xz -f atlassian-stash-3.6.1.tar.gz
mkdir stash
STASH_HOME=/vagrant/stash
export STASH_HOME
cd atlassian-stash-3.6.1
bin/start-stash.sh
exit 0
