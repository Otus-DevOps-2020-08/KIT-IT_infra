#!/bin/sh
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get install apt-transport-https ca-certificates
sudo apt-get update
sleep 20
sudo apt-get install -y mongodb-org
sleep 60
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
