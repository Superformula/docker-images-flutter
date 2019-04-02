#!/usr/bin/env bash

set -e

# pull to make sure we are not rebuilding for nothing
# docker push superformula/flutter:tagname
docker pull superformula/flutter:base

docker build --tag superformula/flutter:base base
docker build --tag superformula/flutter:$FLUTTER_VERSION \
             --tag superformula/flutter:latest \
             --build-arg flutter_version=$FLUTTER_VERSION \
             sdk
