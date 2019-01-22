#!/usr/bin/env bash
mkdir /config/
docker run -d -p 8080:8080 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
docker build -t nginx-kito ./docker/nginx/
docker build -t hello-cont ./docker/app/

docker run --name nginx-lb --restart always-d -p 80:80 443:443 -t nginx-kito -v /config:/etc/nginx
docker run --name hello1 -v /var/www:/var/www -p 8080:8080 -t hello-cont
docker run --name hello2 -v /var/www:/var/www -p 8080:8080 -t hello-cont