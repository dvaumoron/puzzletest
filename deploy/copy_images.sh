#!/usr/bin/env bash

buildah push puzzletest docker-daemon:puzzletest:latest
buildah push puzzlesessionserver docker-daemon:puzzlesessionserver:latest
buildah push puzzlerightserver docker-daemon:puzzlerightserver:latest
buildah push puzzlecachedrightserver docker-daemon:puzzlecachedrightserver:latest
buildah push puzzlesettingsserver docker-daemon:puzzlesettingsserver:latest
buildah push puzzleloginserver docker-daemon:puzzleloginserver:latest
buildah push puzzlesaltserver docker-daemon:puzzlesaltserver:latest
buildah push puzzlemarkdownserver docker-daemon:puzzlemarkdownserver:latest
buildah push puzzleprofileserver docker-daemon:puzzleprofileserver:latest
buildah push puzzleblogserver docker-daemon:puzzleblogserver:latest
buildah push puzzlewikiserver docker-daemon:puzzlewikiserver:latest
buildah push puzzleforumserver docker-daemon:puzzleforumserver:latest

k3d image import puzzletest -c puzzlecluster -t
k3d image import puzzlesessionserver -c puzzlecluster -t
k3d image import puzzlerightserver -c puzzlecluster -t
k3d image import puzzlecachedrightserver -c puzzlecluster -t
k3d image import puzzlesettingsserver -c puzzlecluster -t
k3d image import puzzleloginserver -c puzzlecluster -t
k3d image import puzzlesaltserver -c puzzlecluster -t
k3d image import puzzlemarkdownserver -c puzzlecluster -t
k3d image import puzzleprofileserver -c puzzlecluster -t
k3d image import puzzleblogserver -c puzzlecluster -t
k3d image import puzzlewikiserver -c puzzlecluster -t
k3d image import puzzleforumserver -c puzzlecluster -t
