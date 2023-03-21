#!/usr/bin/env bash

# ensure there is no remaining puzzlecluster in k3d
k3d cluster delete puzzlecluster

# create fake cluster with k3d
k3d cluster create puzzlecluster --servers 3 --api-port 6550 -p "8080:8080@loadbalancer" --agents 1

./deploy/copy_images.sh
