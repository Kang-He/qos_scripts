#!/bin/bash
sudo yum -y install gdisk
sudo sgdisk -n 0:0:0 /dev/sdc -g  #因为node-8不需要跑实验，使用整块ssd
sudo mkfs.xfs /dev/sdc1 -f
mkdir /users/yushua/env
sudo mount /dev/sdc1 /users/yushua/env
sudo chown -R yushua /users/yushua/env

sudo yum install nfs* rpcbind -y
sudo sh -c 'echo "/users/yushua/env/ *(rw,no_all_squash)" > /etc/exports'
sudo service rpcbind restart
sudo service nfs restart
sudo exportfs -rv
