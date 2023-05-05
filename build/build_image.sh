#!/usr/bin/env bash

./build/build.sh

puzzletools prepare

buildah from --name puzzletest-working-container scratch
buildah copy puzzletest-working-container ./locales /locales
buildah copy puzzletest-working-container ./static /static
buildah copy puzzletest-working-container ./templates /templates
buildah copy puzzletest-working-container $HOME/go/bin/puzzletest /bin/puzzletest
buildah config --env SITE_PORT=9080 puzzletest-working-container
buildah config --port 9080 puzzletest-working-container
buildah config --entrypoint '["/bin/puzzletest"]' puzzletest-working-container
buildah commit puzzletest-working-container puzzletest
buildah rm puzzletest-working-container

buildah push puzzletest docker-daemon:puzzletest:latest
