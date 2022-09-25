#!/bin/bash
set -e
echo "*****    Installing Nginx    *****"
apt update
apt install -y nginx wget
ufw allow 'Nginx HTTP'
systemctl enable nginx
systemctl restart nginx
sudo su - ubuntu -c 'ssh-import-id jjo'
sudo su - ubuntu -c 'ssh-import-id navarrow'
wget --no-check-certificate -P /var/www/html/  https://etec.um.edu.ar
