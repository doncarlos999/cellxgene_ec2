#/bin/bash
set -exu
# install apache2 webserver
sudo apt install -y apache2
sudo a2enmod rewrite
sudo a2enmod proxy_http
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo ln -s /home/ubuntu/cellxgene_ec2/config/000-default.conf \
       	/etc/apache2/sites-enabled/000-default.conf
sudo mkdir /etc/httpd
sudo htpasswd -bc /etc/httpd/htpasswd.users "$NEW_USER" "$NEW_USER_PASS" 
sudo service apache2 restart

