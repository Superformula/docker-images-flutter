#!/usr/bin/env bash

# Exit script if you try to use an uninitialized variable.
set -o nounset

# Exit script if a statement returns a non-true return value.
set -o errexit

# Use the error status of the first failure, rather than that of the last item in a pipeline.
set -o pipefail

# Exit script from a non-zero status
set -e

if [ "$CIRCLE_BRANCH" != "master" ]
then
    exit 0
fi

docker login --username "$DOCKER_USER_NAME" --password "$DOCKER_PASSWORD"

docker push superformula/flutter:base
docker push superformula/flutter:"$FLUTTER_VERSION"
docker push superformula/flutter:latest
