export NATS_VERSION=2.8.4

docker build  --rm --no-cache \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg NATS_VERSION=${NATS_VERSION} \
    --tag steedos/nats ./2.8

docker tag steedos/nats steedos/nats:${NATS_VERSION}