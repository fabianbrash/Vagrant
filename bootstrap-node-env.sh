#!/usr/bin/env bash

apt update
apt upgrade -y
apt-get install -y curl zip
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt-get install -y nodejs
apt update
apt upgrade -y
