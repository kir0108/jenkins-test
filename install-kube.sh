#!/bin/bash

sh /worker-init/install-docker.sh
sh /worker-init/install-kubernetes.sh

cp /worker-init/daemon.json /etc/docker

sed -i "$ s/$/ --cgroup-driver=systemd --node-ip=$NODE_IP/" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

tail -3 /worker-init/kubeadm-join.sh >> /worker-init/kubeadm.sh

sed -i "$ a sh /worker-init/kubeadm.sh" /etc/rc.local

sed -i "$ a rm /etc/rc.local" /etc/rc.local

shutdown -r now
