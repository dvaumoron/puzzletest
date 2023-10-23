#!/usr/bin/env bash

./build/build.sh

buildah from --name puzzleweb-working-container scratch
buildah copy puzzleweb-working-container ./static /static
buildah copy puzzleweb-working-container $HOME/go/bin/puzzleweb /bin/puzzleweb
buildah config --env SITE_PORT=9080 puzzleweb-working-container
buildah config --port 9080 puzzleweb-working-container
buildah config --entrypoint '["/bin/puzzleweb"]' puzzleweb-working-container
buildah commit puzzleweb-working-container puzzleweb
buildah rm puzzleweb-working-container

buildah push puzzleweb docker-daemon:puzzleweb:latest
