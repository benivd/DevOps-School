#!/bin/bash
sudo apt-get update

#####Packages for using the last version of git and stash######
sudo apt-get -y install curl openjdk-7-jre openjdk-7-jdk software-properties-common python-software-properties
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get -y install git

#####Stash Install...######
curl -OL http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-3.6.1.tar.gz
tar xz -C /opt -f atlassian-stash-3.6.1.tar.gz
sudo mkdir /opt/stash-home
STASH_HOME=/opt/stash-home
export STASH_HOME

#####Setting user that will run the stash service on startup######
sudo groupadd stash
sudo useradd -m -s /bin/bash -g stash stash
echo stash:stash | sudo chpasswd
sudo chown stash.stash -R /opt/atlassian-stash-3.6.1
sudo chown stash.stash -R /opt/stash-home
sudo cp /vagrant/stash /etc/init.d
sudo chmod  755 /etc/init.d/stash
sudo update-rc.d stash defaults

#####Starting the service for the current session virtualbox(before reboot)######
service stash start

####Installing jenkins####
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
