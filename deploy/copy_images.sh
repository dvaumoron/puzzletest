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
