#!/usr/bin/env bash

puzzletools prepare
go install

buildah from --name puzzletest-working-container scratch
buildah copy puzzletest-working-container ./locales /locales
buildah copy puzzletest-working-container ./static /static
buildah copy puzzletest-working-container ./templates /templates
buildah copy puzzletest-working-container $HOME/go/bin/puzzletest /bin/puzzletest
buildah config --port 8080 puzzletest-working-container
buildah config --entrypoint '["/bin/puzzletest"]' puzzletest-working-container
buildah commit puzzletest-working-container puzzletest
buildah rm puzzletest-working-container
