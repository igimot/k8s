#!/usr/bin/env bash
docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
docker build -t hello-cont/dev ~/docker/Dockerfile
docker run -v /var/www:/var/www -p 80:80 -t hello-cont/dev