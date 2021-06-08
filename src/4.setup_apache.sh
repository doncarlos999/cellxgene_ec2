#/bin/bash
set -exu
# install apache2 webserver
sudo apt install -y apache2
sudo a2enmod rewrite
sudo a2enmod proxy_http
sudo rm /etc/apache2/sites-enabled/000-default.conf
sudo ln -s /home/ubuntu/cellxgene_ec2/config/000-default.conf \
       	/etc/apache2/sites-enabled/000-default.conf
sudo rm /etc/apache2/ports.conf 
sudo ln -s ${HOME}/cellxgene_ec2/config/ports.conf \
	/etc/apache2/ports.conf
sudo mkdir /etc/httpd
sudo htpasswd -bc /etc/httpd/htpasswd1.users "$NEW_USER1" "$NEW_USER_PASS1" 
sudo htpasswd -bc /etc/httpd/htpasswd2.users "$NEW_USER2" "$NEW_USER_PASS2" 
sudo htpasswd -bc /etc/httpd/htpasswd3.users "$NEW_USER3" "$NEW_USER_PASS3" 
sudo service apache2 restart

