#!/usr/bin/env bash

# ensure there is no remaining puzzlecluster in k3d
k3d cluster delete puzzlecluster

# create fake cluster with k3d
export K3D_FIX_DNS=1
k3d cluster create puzzlecluster --api-port 6550 --servers 3 --agents 1 -p "9080:80@loadbalancer:*"

./deploy/copy_images.sh
