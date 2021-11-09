#!/bin/bash
sudo yum -y install gdisk
sudo sgdisk -n 0:0:0 /dev/sdc -g  #因为node-8不需要跑实验，使用整块ssd
sudo mkfs.xfs /dev/sdc1 -f
mkdir /users/zhang56/env
sudo mount /dev/sdc1 /users/zhang56/env
sudo chown -R zhang56 /users/yushua/env

sudo yum install nfs* rpcbind -y
sudo sh -c 'echo "/users/zhang56/env/ *(rw,no_all_squash)" > /etc/exports'
sudo service rpcbind restart
sudo service nfs restart
sudo exportfs -rv
