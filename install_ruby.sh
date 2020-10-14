#!/bin/sh
ssh yc-user@<instace_public_ip>
sudo apt update
sleep 20
sudo apt install -y ruby-full ruby-bundler build-essential
sleep 20
ruby -v
bundler -v
