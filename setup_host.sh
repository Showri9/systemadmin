#!/bin/bash

apt update
apt install -y nfs-common
mkdir -p /var/nfs/keys

while [ ! -f /var/nfs/keys/id_rsa ]; do
  mount 192.168.1.1:/var/nfs/keys /var/nfs/keys
  sleep 10
done

cp /var/nfs/keys/id_rsa* /users/vk9587/.ssh/
chown vk9587: /users/vk9587/.ssh/id_rsa*
runuser -u vk9587 -- cat /users/vk9587/.ssh/id_rsa.pub >> /users/vk9587/.ssh/authorized_keys
