#!/usr/bin/env bash#!/usr/bin/env bash
swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
apt-get update
    apt-get install -y apt-transport-https ca-certificates curl gnupg software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
    cp /etc/apt/sources.list /etc/apt/sources.list.bak
    echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" >> /etc/apt/sources.list
    apt-get update && apt-get install -y docker-ce=$(apt-cache madison docker-ce | grep 18.06 | head -1 | awk '{print $3}')  docker-compose
echo "========================================="
echo "|| Docker and docker-compose installed ||"
echo "========================================="

echo ""
echo ""
echo ""
echo "Would you like test? "
echo "Continue? type y or n"
read contStartCompose
case "$contStartCompose" in
    y|Y) echo "Ok. Its test docker"
    docker run hello-world
         ;;
    n|N) echo "Ok it's your choice. Bay Bay"
        exit 0
        ;;
    *) echo "Sorry need type"
        ;;
esac

#echo -n "" > /tmp/s.sh
######################   install k8s master   #######################
apt-get update && apt-get install -y apt-transport-https
apt-get update
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt install -y kubelet kubeadm kubectl kubernetes-cni
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.88.210 --ignore-preflight-errors=KubeletVersion

mkdir -p $HOME/.kube
cp /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.10.0/Documentation/kube-flannel.yml