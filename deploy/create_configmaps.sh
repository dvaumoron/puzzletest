#!/usr/bin/env bash

kubectl delete configmap puzzletest-cm
kubectl delete configmap puzzlesession-cm
kubectl delete configmap puzzlesalt-cm
kubectl delete configmap puzzlesettings-cm
kubectl delete configmap puzzlelogin-cm
kubectl delete configmap puzzleright-cm
kubectl delete configmap puzzlecachedright-cm
kubectl delete configmap puzzleprofile-cm
kubectl delete configmap puzzlemarkdown-cm
kubectl delete configmap puzzlewiki-cm
kubectl delete configmap puzzleforum-cm
kubectl delete configmap puzzleblog-cm

kubectl create configmap puzzletest-cm --from-file=deploy/conf/cm/puzzletest-cm.txt
kubectl create configmap puzzlesession-cm --from-file=deploy/conf/cm/puzzlesession-cm.txt
kubectl create configmap puzzlesalt-cm --from-file=deploy/conf/cm/puzzlesalt-cm.txt
kubectl create configmap puzzlesettings-cm --from-file=deploy/conf/cm/puzzlesettings-cm.txt
kubectl create configmap puzzlelogin-cm --from-file=deploy/conf/cm/puzzlelogin-cm.txt
kubectl create configmap puzzleright-cm --from-file=deploy/conf/cm/puzzleright-cm.txt
kubectl create configmap puzzlecachedright-cm --from-file=deploy/conf/cm/puzzlecachedright-cm.txt
kubectl create configmap puzzleprofile-cm --from-file=deploy/conf/cm/puzzleprofile-cm.txt
kubectl create configmap puzzlemarkdown-cm --from-file=deploy/conf/cm/puzzlemarkdown-cm.txt
kubectl create configmap puzzlewiki-cm --from-file=deploy/conf/cm/puzzlewiki-cm.txt
kubectl create configmap puzzleforum-cm --from-file=deploy/conf/cm/puzzleforum-cm.txt
kubectl create configmap puzzleblog-cm --from-file=deploy/conf/cm/puzzleblog-cm.txt
