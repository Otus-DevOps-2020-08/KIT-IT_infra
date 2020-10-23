#!/bin/sh
cd /home/ubuntu
sudo apt-get install git
sleep 20
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma
chmod 644 /etc/systemd/system/reddit.service
chmod a+x /home/ubuntu/start-reddit.sh
systemctl start reddit
systemctl enable reddit
