#!/usr/bin/env bash
#mkdir /config/
echo "========================================="
echo "|| Create system                       ||"
echo "========================================="
echo ""
echo ""
echo "Run install docker?"
read contStartCompose
case "$contStartCompose" in
    y|Y) echo "Ok."
        ( exec "/pro/install-docker.sh" )
        #source install-docker.sh
        #exec "install-docker.sh"
         ;;
    n|N) echo "Ok it's your choice. Bay Bay"
        exit 0
        ;;
    *) echo "Sorry need type"
        ;;
esac
echo "Run install k8s?"
read contStartCompose
case "$contStartCompose" in
    y|Y) echo "Ok."
        exec "install-k8s.sh"
         ;;
    n|N) echo "Ok it's your choice. Bay Bay"
        exit 0
        ;;
    *) echo "Sorry need type"
        ;;
esac
echo "Initialized k8s?"
read contStartCompose
case "$contStartCompose" in
    y|Y) echo "Ok."
        exec "init-kubcluster.sh"
         ;;
    n|N) echo "Ok it's your choice. Bay Bay"
        exit 0
        ;;
    *) echo "Sorry need type"
        ;;
esac
echo "Build image Hello-world?"
read contStartCompose
case "$contStartCompose" in
    y|Y) echo "Ok."
        exec "build-image.sh"
         ;;
    n|N) echo "Ok it's your choice. Bay Bay"
        exit 0
        ;;
    *) echo "Sorry need type"
        ;;
esac
echo "Create 4 container Hello-world $ nginx on docker?"
read contStartCompose
case "$contStartCompose" in
    y|Y) echo "Ok."
        exec "create-4cont-nginx-on-docker.sh"
         ;;
    n|N) echo "Ok it's your choice. Bay Bay"
        exit 0
        ;;
    *) echo "Sorry need type"
        ;;
esac
echo "Create and deploy image Hello-world to k8s?"
read contStartCompose
case "$contStartCompose" in
    y|Y) echo "Ok."
        exec "create-and-deploy-cont-to-kub.sh"
         ;;
    n|N) echo "Ok it's your choice. Bay Bay"
        exit 0
        ;;
    *) echo "Sorry need type"
        ;;
esac
#exec "install-docker.sh"
#exec "install-k8s.sh"
#exec "init-kubcluster.sh"
#exec "build-image.sh"
#exec "create-4cont-nginx-on-docker.sh"
#exec "create-and-deploy-cont-to-kub.sh"





