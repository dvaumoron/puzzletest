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

kubectl create configmap puzzletest-cm --from-env-file=deploy/conf/cm/puzzletest-cm.env
kubectl create configmap puzzlesession-cm --from-env-file=deploy/conf/cm/puzzlesession-cm.env
kubectl create configmap puzzlesalt-cm --from-env-file=deploy/conf/cm/puzzlesalt-cm.env
kubectl create configmap puzzlesettings-cm --from-env-file=deploy/conf/cm/puzzlesettings-cm.env
kubectl create configmap puzzlelogin-cm --from-env-file=deploy/conf/cm/puzzlelogin-cm.env
kubectl create configmap puzzleright-cm --from-env-file=deploy/conf/cm/puzzleright-cm.env
kubectl create configmap puzzlecachedright-cm --from-env-file=deploy/conf/cm/puzzlecachedright-cm.env
kubectl create configmap puzzleprofile-cm --from-env-file=deploy/conf/cm/puzzleprofile-cm.env
kubectl create configmap puzzlemarkdown-cm --from-env-file=deploy/conf/cm/puzzlemarkdown-cm.env
kubectl create configmap puzzlewiki-cm --from-env-file=deploy/conf/cm/puzzlewiki-cm.env
kubectl create configmap puzzleforum-cm --from-env-file=deploy/conf/cm/puzzleforum-cm.env
kubectl create configmap puzzleblog-cm --from-env-file=deploy/conf/cm/puzzleblog-cm.env
