#!/bin/bash
#
# Setup for NFS Server
# https://linuxhint.com/install-and-configure-nfs-server-ubuntu-22-04/

set -euxo pipefail

sudo apt install -y nfs-kernel-server

sudo mkdir -p /mnt/data
sudo chown -R nobody:nogroup /mnt/data
sudo chmod 777 /mnt/data

# added 'no_root_squash' - please carefully read nfs documentation what that means
echo '/mnt/data 172.11.0.0/24(rw,sync,no_subtree_check,no_root_squash)' >> /etc/exports
sudo exportfs -a
sudo systemctl restart nfs-kernel-server

#sudo ufw allow from 10.0.2.0/24 to any port nfs
#sudo ufw enable
#sudo ufw status
