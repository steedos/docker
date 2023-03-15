#!/bin/bash
export VSCODE_SERVER_VERSION=1.76.1

echo "#########################################################################"
echo "steedos vscode server version: ${VSCODE_SERVER_VERSION}"
echo "#########################################################################"

docker build --rm --no-cache \
    --build-arg NODE_VERSION=14 \
    --build-arg VSCODE_SERVER_VERSION=${VSCODE_SERVER_VERSION} \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg TAG_SUFFIX=default \
    --file Dockerfile \
    --tag steedos/vscode-server .

docker tag steedos/vscode-server steedos/vscode-server:${VSCODE_SERVER_VERSION}