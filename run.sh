#!/usr/bin/env bash
#mkdir /config/
#docker run -d -p 80:80 --name nginx-proxy --restart always -v /tmp/nginx:/etc/nginx/conf.d -t nginx
#docker run -d -p 80:80 --name nginx-proxy --restart always -v /var/run/docker.sock:/tmp/docker.sock:ro  jwilder/nginx-proxy
docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
#docker run --name my-custom-nginx-container -v /host/path/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx
docker run -e VIRTUAL_HOST=hello-portiner.com --expose=80  --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
docker build -t nginx-kito ./docker/nginx/
#docker build -t hello-cont ./docker/app/
#docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
docker run -t -d --name hello1 -v /var/www:/var/www -e VIRTUAL_HOST=hello1.com --restart always --expose=80  hello-cont
docker run -t -d --name hello2 -v /var/www:/var/www -e VIRTUAL_HOST=hello1.com --restart always --expose=80  hello-cont
docker run -t -d --name hello3 -v /var/www:/var/www -e VIRTUAL_HOST=hello3.com --restart always --expose=80  hello-cont
docker run -t -d --name hello4 -v /var/www:/var/www -e VIRTUAL_HOST=hello4.com --restart always --expose=80  hello-cont
