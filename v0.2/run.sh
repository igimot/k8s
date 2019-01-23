#!/usr/bin/env bash
#mkdir /config/
exec "install-docker.sh"
exec "install-k8s.sh"
exec "init-kubcluster.sh"
exec "build-image.sh"
exec "create-4cont-nginx-on-docker.sh"
exec "create-and-deploy-cont-to-kub.sh"





