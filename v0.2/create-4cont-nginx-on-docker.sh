#!/usr/bin/env bash
docker run -d -p 80:80 --name nginx-proxy -v /var/run/docker.sock:/tmp/docker.sock:ro nginx-proxy:v1

docker run -d -p 9000:9000 --name portainer -e VIRTUAL_HOST=hello-portiner.com  --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
docker run -t -d --name hello1 -v /var/www:/var/www -e VIRTUAL_HOST=hello1.com --restart always --expose=80  hello-cont
docker run -t -d --name hello2 -v /var/www:/var/www -e VIRTUAL_HOST=hello2.com --restart always --expose=80  hello-cont
docker run -t -d --name hello3 -v /var/www:/var/www -e VIRTUAL_HOST=hello3.com --restart always --expose=80  hello-cont
docker run -t -d --name hello4 -v /var/www:/var/www -e VIRTUAL_HOST=hello4.com --restart always --expose=80  hello-cont