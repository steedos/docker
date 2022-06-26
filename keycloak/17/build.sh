export KEYCLOAK_VERSION=17.0.0

echo "#########################################################################"
echo "keycloak version: ${KEYCLOAK_VERSION}"
echo "#########################################################################"

docker build --rm --no-cache \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg TAG_SUFFIX=default \
    --build-arg KEYCLOAK_VERSION=${KEYCLOAK_VERSION} \
    --file Dockerfile \
    --tag steedos/keycloak .

docker tag steedos/keycloak steedos/keycloak:${KEYCLOAK_VERSION}

docker push steedos/keycloak
docker push steedos/keycloak:${KEYCLOAK_VERSION}
