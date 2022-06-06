#!/bin/bash 

# UPdate the apt-get cache
sudo apt-get update

# install php
sudo apt-get install -y php

#install webserver
sudo apt-get install -y apache2

#copy code from the repository 
sudo git clone https://github.com/brikis98/php-app.git /var/www/html/app
#Start Apache
sudo serive apache2 Start