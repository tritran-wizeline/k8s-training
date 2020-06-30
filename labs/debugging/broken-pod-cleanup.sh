#!/usr/bin/env sh

kubectl delete po auth-ws -n candy-store
kubectl delete po build-svc -n internal
kubectl delete po candy-ws -n candy-store
kubectl delete po cart-ws -n candy-store
kubectl delete po inventory-svc
kubectl delete po shipping-svc
kubectl delete ns candy-store
kubectl delete ns internal
