#!/usr/bin/env bash
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