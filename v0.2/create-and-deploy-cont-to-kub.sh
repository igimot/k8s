#!/usr/bin/env bash
kubectl run hello1 --image=hello-cont:v1 --port=80
kubectl expose deployment hello1 --type=NodePort