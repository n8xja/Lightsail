#!/bin/bash

# Steps after Lightsail Instance:

# Install GIT
sudo apt-get -y install git ; sleep 3

# GIT Toolkit
git clone https://github.com/n8xja/Lightsail.git

cd Lightsail/
bash install_wp_cli.sh 
wp plugin delete --all; sleep 3

# wp_cli doesn't get rid of all the files in all-in-one-wp-migration
rm -Rf  /home/bitnami/apps/wordpress/htdocs/wp-content/plugins/*

wp plugin install all-in-one-wp-migration --activate; sleep 3
bash fileprivs_fix.sh


