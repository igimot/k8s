#!/usr/bin/env bash
docker build -t hello-cont ./docker/app/
docker run --detach \
    --restart always \
    --name nginx-proxy \
    --publish 80:80 \
    --publish 443:443 \
    --volume /etc/nginx/certs \
    --volume /etc/nginx/vhost.d \
    --volume /usr/share/nginx/html \
    --volume /var/run/docker.sock:/tmp/docker.sock:ro \
    jwilder/nginx-proxy

docker run --detach \
    --name nginx-proxy-letsencrypt \
    --volumes-from nginx-proxy \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    jrcs/letsencrypt-nginx-proxy-companion

docker run --detach \
        --env "VIRTUAL_HOST=hello-portiner.com" \
        --env "VIRTUAL_PORT=3000" \
        --env "LETSENCRYPT_HOST=hello-portiner.com" \
        --env "LETSENCRYPT_EMAIL=mail@hello-portiner.com" \
        --name portainer\
        --restart always \
        -v /var/run/docker.sock:/var/run/docker.sock \
         -v portainer_data:/data \
         --expose=8080 \
      portainer/portainer

docker run --detach \
    --name hello1\
    --env "VIRTUAL_HOST=1.hello.com" \
    -v /var/www:/var/www \
    --env "VIRTUAL_PORT=8080" \
    --env "LETSENCRYPT_HOST=1.hello.com" \
    --env "LETSENCRYPT_EMAIL=mail@hello.com" \
    --restart always \
    --expose=8080 \
    hello-cont
docker run --detach \
    --name hello2\
    --env "VIRTUAL_HOST=2.hello.com" \
    -v /var/www:/var/www \
    --env "VIRTUAL_PORT=8080" \
    --env "LETSENCRYPT_HOST=2.hello.com" \
    --env "LETSENCRYPT_EMAIL=mail@hello.com" \
    --restart always \
    --expose=8080 \
    hello-cont
docker run --detach \
    --name hello3\
    --env "VIRTUAL_HOST=3.hello.com" \
    -v /var/www:/var/www \
    --env "VIRTUAL_PORT=8080" \
    --env "LETSENCRYPT_HOST=3.hello.com" \
    --env "LETSENCRYPT_EMAIL=mail@hello.com" \
    --restart always \
    --expose=8080 \
    hello-cont


#docker run -t -d --name hello1 -v /var/www:/var/www -e VIRTUAL_HOST=hello1.com --restart always --expose=8080  hello-cont
#docker run -t -d --name hello2 -v /var/www:/var/www -e VIRTUAL_HOST=hello2.com --restart always --expose=8080  hello-cont
#docker run -t -d --name hello3 -v /var/www:/var/www -e VIRTUAL_HOST=hello3.com --restart always --expose=8080  hello-cont
#docker run -t -d --name hello4 -v /var/www:/var/www -e VIRTUAL_HOST=hello4.com --restart always --expose=8080  hello-cont
