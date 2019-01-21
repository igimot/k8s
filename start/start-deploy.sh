#!/usr/bin/env bash
#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=socks.kub.loc/O=nginx"
#kubectl create secret tls tls-secret --key tls.key --cert tls.crt
echo "========================================="
echo "|| ARE YOU SURE ? ||"
echo "========================================="
read contStartCompose
case "$contStartCompose" in
    y|Y) echo "Ok. Its test docker"
    docker run hello-world
    echo "========================================="
    echo "|| Test GOOD ?||"
    echo "========================================="
    read testGoodOrNot
         ;;
    n|N) echo "Ok it's your choice. Bay Bay"
        exit 0
        ;;
    *) echo "Sorry need type"
        ;;
esac
cat >auth <<EOF
test_user1::admin
wtf_admin:5IXYK2dcdc77676gg
EOF
kubectl create secret generic basic-auth --from-file=auth
rm -fv auth
kubectl get secret basic-auth -o yaml
kubectl create -f tls-exemple.yaml
kubectl create -f default-backend.yaml
kubectl create -f nginx-ingress-controller.yaml
kubectl create -f hello-node.yaml
kubectl create -f hello-ingress.yaml
