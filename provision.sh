#!/usr/bin/env bash

echo "Instalação e execução do setup"

apt update
apt install -y git apache2

# Baixa o repositório do OAI em local definido
cd /home/vagrant

if [ ! -d "oai" ]; then
    git clone https://github.com/pauloeugenio/oai.git
else
    cd oai
    git pull
fi

chown -R vagrant:vagrant /home/vagrant/oai

mkdir -p /var/www/html
cp -r /vagrant/html/. /var/www/html/

systemctl enable apache2
systemctl start apache2

ufw allow 'Apache'
ufw reload || true
