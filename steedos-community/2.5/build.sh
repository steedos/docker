#!/bin/bash
export STEEDOS_VERSION=2.5

echo "#########################################################################"
echo "steedos community version: ${STEEDOS_VERSION}"
echo "#########################################################################"

docker build --rm --no-cache \
    --build-arg ARCH=amd64 \
    --build-arg NODE_VERSION=14 \
    --build-arg STEEDOS_VERSION=${STEEDOS_VERSION} \
    --build-arg OS=alpine3.12 \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg TAG_SUFFIX=default \
    --file Dockerfile \
    --tag steedos/steedos-community .

docker tag steedos/steedos-community steedos/steedos-community:${STEEDOS_VERSION}