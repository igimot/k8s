#!/usr/bin/env bash
kubeadm reset -f
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X
ipvsadm -C
cd
rm -rf k8s
echo "GOOOD"
git clone https://github.com/igimot/k8s.git

mv -rf /k8s/ /tmp
