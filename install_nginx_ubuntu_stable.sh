#!/bin/bash
### Install nginx Ubuntu created by Nizar ###
###		Version 1.0 		  ###
### Inspired by https://www.nginx.com/resources/wiki/start/topics/tutorials/install/ ###

# get codename of the os
codename=$(lsb_release -c | awk '{print $2}')

# add repo
echo -e "deb https://nginx.org/packages/ubuntu/ $codename nginx\ndeb-src https://nginx.org/packages/ubuntu/ $codename nginx" | tee -a /etc/apt/sources.list.d/nginx.list

#add key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62


# update and install nginx
apt update -y
apt info nginx



while true; do
	read -p "Do you wish to install that nginx? " yn
	case $yn in
		[Yy]* ) apt install nginx -y; break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no! ";;
	esac
done
# add key
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys
