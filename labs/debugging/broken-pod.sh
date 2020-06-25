#!/usr/bin/env sh

kubectl create ns candy-store
kubectl create ns internal
kubectl apply -f broken-pod.yaml
