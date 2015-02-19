#!/bin/sh
sudo apt-get update

#####Packages for using the last version of git and stash######
sudo apt-get -y install curl openjdk-7-jre openjdk-7-jdk software-properties-common python-software-properties
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get -y install git

##############################
sudo curl -OL http://apache.mivzakim.net//ant/binaries/apache-ant-1.9.4-bin.tar.gz
sudo tar xz -C /opt -f apache-ant-1.9.4-bin.tar.gz
ANT_HOME=/opt/apache-ant-1.9.4
PATH=$ANT_HOME/bin:$PATH
export PATH ANT_HOME

#####Stash Install...######
#curl -OL http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-3.6.1.tar.gz
#tar xz -C /opt -f atlassian-stash-3.6.1.tar.gz
#STASH_HOME=/home/stash
#export STASH_HOME

#####Setting user that will run the stash service on startup######
#sudo groupadd stash
#sudo useradd -m -s /bin/bash -g stash stash
#echo stash:stash | sudo chpasswd
#sudo chown stash.stash -R /opt/atlassian-stash-3.6.1
#sudo chown stash.stash -R STASH_HOME
#sudo cp /vagrant/stash /etc/init.d
#sudo chmod  755 /etc/init.d/stash
#sudo update-rc.d stash defaults

#####Starting the service for the current session virtualbox(before reboot)######
#service stash start

####Installing jenkins####
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get -y update
sudo apt-get -y install jenkins
###########################
sleep 60
sudo wget http://localhost:8080/jnlpJars/jenkins-cli.jar
sudo wget -O default.js http://updates.jenkins-ci.org/update-center.json
sed '1d;$d' default.js > default.json
curl -X POST -H "Accept: application/json" -d @default.json http://localhost:8080/updateCenter/byId/default/postBack --verbose
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin credentials
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin CVS Plugin 
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin Javadoc Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin JUnit Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin mailer Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin LDAP Plugin 
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin matrix-auth Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin matrix-project Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin maven-plugin Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin antisamy-markup-formatter Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin pam-auth Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin subversion Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin translation Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin GitHub Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin ws-cleanup Plugin
java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart
echo "finish"

######build jenkins job####
#java -jar jenkins-cli.jar -s http://localhost:8080/ create-job HelloWorld
#sudo cp /vagrant/config.xml /var/lib/jenkins/jobs/HelloWorld
