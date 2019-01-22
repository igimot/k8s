#!/usr/bin/env bash

echo "========================================="
echo "|| ARE YOU SURE, start deployment ? ||"
echo "========================================="
read contStartDeploy
case "$contStartDeploy" in
    y|Y) echo "Ok. Its test docker"
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=socks.kub.loc/O=nginx"
    kubectl create secret tls testsecret-tls --key tls.key --cert tls.crt
    echo "test_user1::admin
    wtf_admin:5IXYK2dcdc77676gg" > auth
    kubectl create secret generic basic-auth --from-file=auth
    #rm -fv auth
    kubectl get secret basic-auth -o yaml
    kubectl create -f default-backend.yaml
    #kubectl create -f nginx-ingress-controller.yaml
    kubectl create -f nginx-ingress-create.yaml
    kubectl create -f hello-node.yaml
    kubectl create -f hello-ingress.yaml

         ;;
    n|N) echo "Ok it's your choice. Bay Bay"
        exit 0
        ;;
    *) echo "Sorry need type"
        ;;
esac

#kubectl create -f tls-exemple.yaml