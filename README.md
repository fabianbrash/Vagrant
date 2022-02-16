# Vagrant


### vagrant is available for most platforms Linux, MAC, and Windows head over to
[vagrantup.com](https://vagrantup.com)

### initialize vagrant

````
mkdir vagrantmachines

mkdir -p vagrantmachines/ubuntu_xenial

vagrant init ubuntu/xenial64

vagrant init  #no image specified

vagrant up

vagrant status  ##get the status of vagrant

vagrant --help

vagrant --list-commands

vagrant box list   ###list our box(es)

vagrant box add hashicorp/bionic64

vagrant box update --box ubuntu/bionic64 ## Note this will keep the old and the new

vagrant destroy  ##destroy our box(es)

vagrant destroy -f

vagrant box remove hashicorp/bionic64

vagrant ssh  ##ssh into our vagrant machine

vagrant ssh node-1

vagrant rdp  ##duh

````
