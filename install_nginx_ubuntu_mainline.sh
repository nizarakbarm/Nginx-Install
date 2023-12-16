#!/bin/bash

### Nginx Mainline Installer by Nizar ###
### 		Version 1.0 	      ###
### 	      Inspired by https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/ ###

#install dependencies
apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring

#add key for nginx repo
curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
	| sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg > /dev/null

#verify keyring
if [[ $(gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg) =~ 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 ]]
then
	echo "Keyring Verified!"
fi

#add repository nginx mainline
echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
	http://nginx.org/packages/mainline/ubuntu $(lsb_release -cs) nginx" \
	| sudo tee -a /etc/apt/sources.list.d/nginx.list

#set up repository pinning to refer packages from nginx mainline
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | sudo tee -a /etc/apt/preferences.d/99nginx

#apt update
apt update -y

#get info of nginx
apt info nginx


#prompt to install nginx
while true; do
	read -p "Do you wish to install that nginx? " yn
	case $yn in
		[Yy]* ) apt install nginx -y; break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no! ";;
	esac
done
