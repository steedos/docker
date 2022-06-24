
docker build --rm --no-cache \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg TAG_SUFFIX=default \
    --file Dockerfile \
    --tag steedos/keycloak .

docker tag steedos/keycloak steedos/keycloak:18.0.1