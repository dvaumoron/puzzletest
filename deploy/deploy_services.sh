#!/usr/bin/env bash

kubectl apply -f deploy/conf/k8s/external-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzletest-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzlesession-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzleright-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzlecachedright-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzlesettings-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzlelogin-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzlesalt-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzlemarkdown-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzleprofile-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzleblog-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzlewiki-k8s.yaml
kubectl apply -f deploy/conf/k8s/puzzleforum-k8s.yaml
