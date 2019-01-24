#!/usr/bin/env bash
#kubectl run hello1 --image=hello-cont --port=8080
#kubectl run hello-big-node --image=hello-big-world --port=9877
kubectl run hello-big-node --image=vwarship/hello-world:latest --port=80
kubectl run hello-big-node2 --image=hello-big-world:latest --port=80

#kubectl create deployment hello-node-2 --image=vwarship/hello-world:latest
#kubectl get deployments
#kubectl get pods
#kubectl get events
#kubectl config view
kubectl expose deployment hello-big-node --type=NodePort
#kubectl expose deployment hello-node --type=LoadBalancer --port=8080
#kubectl get services





#kubectl expose deployment hello1 --type=NodePort




kubectl get pod hello1
#curl http://192.168.12.131/guid ; echo
curl http://10.244.0.3:9879/hello-test-node ; echo