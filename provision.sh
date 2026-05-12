#!/usr/bin/env bash

echo "Instalação e execução do setup"

apt update
apt install -y git

# Baixa o repositório do OAI em local definido
cd /home/vagrant

if [ ! -d "oai" ]; then
    git clone https://github.com/pauloeugenio/oai.git
else
    cd oai
    git pull
fi

chown -R vagrant:vagrant /home/vagrant/oai


