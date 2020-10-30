#!/bin/sh
sudo apt update
sleep 20
sudo apt install -y ruby-full ruby-bundler build-essential
ruby -v
bundler -v
