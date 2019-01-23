#!/usr/bin/env bash
#kubectl run hello1 --image=hello-cont --port=8080

kubectl create deployment hello-node-2 --image=hello-world:latest
#kubectl get deployments
#kubectl get pods
#kubectl get events
#kubectl config view
kubectl expose deployment hello-node --type=LoadBalancer --port=8080
#kubectl get services





#kubectl expose deployment hello1 --type=NodePort




kubectl get pod hello1
#curl http://192.168.12.131/guid ; echo