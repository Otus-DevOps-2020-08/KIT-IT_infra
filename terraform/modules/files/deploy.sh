#!/bin/bash
sleep 20
set -e
APP_DIR=${1:-$HOME}
DATABASE_URL=${1:-"127.0.0.1:21017"}
echo "sudo apt-get update !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
sudo apt-get update
sudo apt-get install -y ruby ruby-dev
sleep 20
sudo apt-get install -y gcc
sleep 20
sudo apt-get install -y make
sleep 20
sudo gem install bcrypt
sleep 20
sudo gem install bundle
sleep 20
echo "apt-get install -y git !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
sudo apt-get install -y git
sleep 20
echo "git clone !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
sudo git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
sleep 20
pwd
cd $APP_DIR/reddit && sudo bundle install
sudo sed "s/{{db_url}}/$DATABASE_URL/g" /tmp/puma.service > /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
