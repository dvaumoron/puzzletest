#!/usr/bin/env bash

kubectl delete configmap puzzletest-cm
kubectl create configmap puzzletest-cm --from-file=deploy/puzzletest-cm.txt
