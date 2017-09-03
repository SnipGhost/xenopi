#!/bin/bash
#------------------------------------------------------------------------------------------------------------
PROJECT_PATH='/usr/xenopi'
#------------------------------------------------------------------------------------------------------------
GRE='\033[0;32m'
NCC='\033[0m'
#------------------------------------------------------------------------------------------------------------
apt-get -y update
apt-get -y install git elinks apache2 libapache2-mod-php5
#------------------------------------------------------------------------------------------------------------
echo -e "${GRE}Starting to clone project repository${NCC}"
if ! [ -d $PROJECT_PATH/ ]; then
    git clone http://github.com/snipghost/xenopi $PROJECT_PATH
else
    cd $PROJECT_PATH
    git pull origin master
fi
#------------------------------------------------------------------------------------------------------------
echo -e "${GRE}Starting to copy configuration files${NCC}"
cp -f $PROJECT_PATH/apache-ports.conf /etc/apache2/ports.conf
cp -f $PROJECT_PATH/apache-default.conf /etc/apache2/sites-enabled/000-default.conf
#------------------------------------------------------------------------------------------------------------
service apache2 restart
#------------------------------------------------------------------------------------------------------------