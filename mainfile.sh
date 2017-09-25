#!/bin/bash

###################
# apt-get modules #
###################

apt-get -y update 			# update repository
apt-get install -y python-pip  		# This is mandatory for pip packages


##################
# Install Php  	 #
##################

add-apt-repository ppa:ondrej/php    	# This ll add php in repository
apt-get -y update			# update repository	
apt-get install -y php5.6		# Install php5.6
#apt install php libapache2-mod-php

##################
# Python Module  #
##################

pip install -r https://raw.githubusercontent.com/tailordevs/AzureTesting/master/requirement.txt 	#link can be change


#########################
# Folder Management 	#
#########################

cd /var
mkdir -p www
cd www
chmod 777 /var/www/

mkdir -p dsyh_main
cd dsyh_main
mkdir -p production
mkdir -p staging
cd


#############################
# Git Deployment  (staging) #
#############################

cd /var/www/dsyh_main/staging/
git init
git remote add origin https://github.com/desairavi1101/Train-Application.git	


################################
# Git Deployment  (production) #
################################

cd /var/www/dsyh_main/production/
git init
git remote add origin https://github.com/desairavi1101/Train-Application.git	


########################
# Cron Tab Activities  #
########################

JOB="*/1 * * * * /bin/sh -c 'cd /var/www/dsyh_main/production/ && git pull origin master' > /var/www/autodeploy.txt"

FINDJOB=$(crontab -l | grep -F "$JOB")

echo " "

if [ -z "$FINDJOB" ]
then
  echo "Cron job doesn't exist yet, adding it to crontab"

  (crontab -l 2>/dev/null; echo "$JOB") | crontab -
else
  echo "Cron job already added!"
fi

echo " "
echo "Contents of crontab: (crontab -l)"

crontab -l

echo " "
echo "To edit cron manually, execute: 'crontab -e'"
echo " "










