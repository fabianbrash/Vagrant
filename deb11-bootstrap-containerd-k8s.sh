#!/usr/bin/env bash

apt-get update && apt-get upgrade -y

apt-get install -y apt-transport-https ca-certificates curl

cat <<EOF | tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

# Setup required sysctl params, these persist across reboots.
cat <<EOF | tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Apply sysctl params without reboot
sysctl --system

apt-get update && apt-get install -y containerd

mkdir -p /etc/containerd
containerd config default | tee /etc/containerd/config.toml

systemctl restart containerd

swapoff -a

# Add k8s repos
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list

#echo '192.168.56.31  node-1' | tee -a /etc/hosts
#echo '192.168.56.32  node-2' | tee -a /etc/hosts
#echo '192.168.56.21  master-1' | tee -a /etc/hosts


## install helm 3.8.0

#curl -LO https://get.helm.sh/helm-v3.8.0-linux-amd64.tar.gz
#tar -xzvf helm-v3.8.0-linux-amd64.tar.gz
#sudo cp linux-amd64/helm /usr/local/bin
