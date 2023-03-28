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

kind load docker-image puzzletest -n puzzlecluster
kind load docker-image puzzlesessionserver -n puzzlecluster
kind load docker-image puzzlerightserver -n puzzlecluster
kind load docker-image puzzlecachedrightserver -n puzzlecluster
kind load docker-image puzzlesettingsserver -n puzzlecluster
kind load docker-image puzzleloginserver -n puzzlecluster
kind load docker-image puzzlesaltserver -n puzzlecluster
kind load docker-image puzzlemarkdownserver -n puzzlecluster
kind load docker-image puzzleprofileserver -n puzzlecluster
kind load docker-image puzzleblogserver -n puzzlecluster
kind load docker-image puzzlewikiserver -n puzzlecluster
kind load docker-image puzzleforumserver -n puzzlecluster
