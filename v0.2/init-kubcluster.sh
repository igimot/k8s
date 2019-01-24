#!/usr/bin/env bash
#
echo "Check hostname hots & dns "
sysctl net.bridge.bridge-nf-call-iptables=1
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.88.210 --ignore-preflight-errors=KubeletVersion

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
#https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml

#kubectl apply -f https://docs.projectcalico.org/v3.4/getting-started/kubernetes/installation/hosted/etcd.yaml
#kubectl apply -f https://docs.projectcalico.org/v3.4/getting-started/kubernetes/installation/hosted/calico.yaml
watch kubectl get pods --all-namespaces
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl get nodes -o wide
#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml