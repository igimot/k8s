#!/usr/bin/env bash

#kubectl run hello-big-node --image=vwarship/hello-world:latest --port=80
#deploy pod
kubectl run hello-test-pode --image=hello-big-world:latest --port=80

#kubectl get deployments
#kubectl get pods
#kubectl get events
#kubectl config view
#kubectl describe pod
#kubectl get services

# create service
kubectl expose deployment hello-test4-pode --type=NodePort


#kubectl expose deployment hello-node --type=LoadBalancer --port=8080
#kubectl get services
#   Remove pods kubectl delete service,deployment <name pods>



#docker run --rm -v /run/docker.sock:/run/docker.sock centurylink/dockerfile-from-image vwarship/hello-world:latest
#alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm chenzj/dfimage"
#dfimage IMAGE_ID > Dockerfile

#kubectl expose deployment hello1 --type=NodePort




kubectl get pod hello1
#curl http://192.168.12.131/guid ; echo
curl http://10.244.0.26:8080/ ; echo