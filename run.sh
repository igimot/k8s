#!/usr/bin/env bash
docker run -d -p 9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
docker build -t nginx-kito ./docker/nginx/
docker build -t hello-cont ./docker/app/

docker run -v /var/www:/var/www -p 9000 -t hello-cont