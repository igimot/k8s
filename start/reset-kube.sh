#!/usr/bin/env bash
kubeadm reset -f
cd
rm -rf k8s
echo "GOOOD"
git clone https://github.com/igimot/k8s.git
cd ~/k8s/start
