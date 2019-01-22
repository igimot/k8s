#!/usr/bin/env bash
mkdir /config/
docker run -d -p 80:80 --restart always -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
docker run -e VIRTUAL_HOST=hello-portiner.com --expose=80 d -p 8080:8080 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

#docker build -t nginx-kito ./docker/nginx/
docker build -t hello-cont ./docker/app/

#docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
docker run --name hello1 VIRTUAL_HOST=hello1.com --restart always --expose=80 -v /var/www:/var/www  -t hello-cont
docker run --name hello2 VIRTUAL_HOST=hello1.com --restart always --expose=80 -v /var/www:/var/www  -t hello-cont