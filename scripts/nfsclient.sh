#!/bin/bash
#
# Setup for NFS Server
# https://linuxhint.com/install-and-configure-nfs-server-ubuntu-22-04/

set -euxo pipefail

sudo apt install -y nfs-common

sudo mkdir -p /mnt/data
sudo chown -R nobody:nogroup /mnt/data
sudo chmod 777 /mnt/data

# sudo mount nfs-server:/mnt/data /mnt/data

# persistant mount
echo "nfs-server:/mnt/data //mnt/data  nfs      defaults    0       0" >> /etc/fstab
sudo mount /mnt/data