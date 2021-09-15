#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
apt-get install -y python3 python3-pip python3-venv
touch /etc/pip.conf

cat <<EOF > /etc/pip.conf
[global]
trusted-host = pypi.python.org
               pypi.org
               files.pythonhosted.org

EOF

pip3 install --upgrade pip
