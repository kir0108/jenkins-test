#!/bin/bash

swapoff -a
rm /swap.img
sed -i '/swap/ s/^/#/' /etc/fstab
sh /worker-init/install-kube.sh
