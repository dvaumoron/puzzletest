#!/usr/bin/env bash

# ensure there is no remaining puzzlecluster in k3d
helm delete istio-ingress -n istio-system
helm delete istiod -n istio-system
helm delete istio-base -n istio-system
k3d cluster delete puzzlecluster

# create fake cluster with k3d
k3d cluster create puzzlecluster --servers 3 --api-port 6550 -p "9080:80@loadbalancer"  -p "9443:443@loadbalancer" --agents 2 --k3s-arg '--disable=traefik@server:*'

# set up Istio
kubectl create namespace istio-system
helm install istio-base istio/base -n istio-system --wait
helm install istiod istio/istiod -n istio-system --wait

# install ingress gateway
kubectl label namespace istio-system istio-injection=enabled
helm install istio-ingress istio/gateway -n istio-system --wait
