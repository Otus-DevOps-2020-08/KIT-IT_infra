#!/bin/bash
sleep 20
set -e
APP_DIR=${1:-$HOME}
echo "sudo apt-get update !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
sudo apt-get update
sudo apt-get install -y ruby ruby-dev
sleep 5
sudo apt-get install -y gcc
sudo apt-get install -y make
sudo gem install bcrypt
sudo gem install bundle
sleep 20
echo "apt-get install -y git !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
sudo apt-get install -y git
sleep 20
echo "git clone !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
sudo git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
sleep 20
pwd
cd $APP_DIR/reddit && bundle install
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
