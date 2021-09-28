#!/usr/bin/env bash

apt-get update
apt-get install -y curl python3 g++ make zip
curl -kLO https://nodejs.org/dist/v14.18.0/node-v14.18.0.tar.gz
tar -xzvf node-v14.18.0.tar.gz
cd node-v14.18.0/
./configure
make -j4
make install
apt update
apt upgrade -y
