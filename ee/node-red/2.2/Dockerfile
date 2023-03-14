ARG ARCH=amd64
ARG NODE_VERSION=14
ARG OS=alpine3.12

#### Stage BASE ########################################################################################################
FROM ${ARCH}/node:${NODE_VERSION}-${OS} AS base

# Copy scripts
COPY scripts/*.sh /tmp/

# Install tools, create Node-RED app and data dir, add user and set rights
RUN set -ex && \
    apk add --no-cache \
        bash \
        tzdata \
        iputils \
        curl \
        nano \
        git \
        openssl \
        openssh-client \
        ca-certificates && \
    mkdir -p /app /data && \
    deluser --remove-home node && \
    adduser -h /app -D -H node-red -u 1000 && \
    chown -R node-red:root /data && chmod -R g+rwX /data && \
    chown -R node-red:root /app && chmod -R g+rwX /app
    # chown -R node-red:node-red /data && \
    # chown -R node-red:node-red /app

# Set work directory
WORKDIR /app

# Setup SSH known_hosts file
COPY known_hosts.sh .
RUN ./known_hosts.sh /etc/ssh/ssh_known_hosts && rm /app/known_hosts.sh

# package.json contains Node-RED NPM module and node dependencies
COPY package.json .
COPY flows.json /data


#### Stage BUILD #######################################################################################################
FROM base AS build

# Install Build tools
RUN apk add --no-cache --virtual buildtools build-base linux-headers udev python2 && \
    npm install --unsafe-perm --no-update-notifier --no-fund --only=production && \
    /tmp/remove_native_gpio.sh && \
    cp -R node_modules prod_node_modules

#### Stage RELEASE #####################################################################################################
FROM base AS RELEASE
ARG BUILD_DATE
ARG BUILD_VERSION
ARG BUILD_REF
ARG NODE_RED_VERSION
ARG ARCH
ARG TAG_SUFFIX=default

LABEL org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.docker.dockerfile=".docker/Dockerfile.alpine" \
    org.label-schema.license="Apache-2.0" \
    org.label-schema.name="Steedos Node-RED" \
    org.label-schema.version=${BUILD_VERSION} \
    org.label-schema.description="Low-code programming for event-driven applications." \
    org.label-schema.url="https://www.steedos.com" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vcs-url="https://github.com/steedos/docker/node-red" \
    org.label-schema.arch=${ARCH} \
    authors="Steedos Inc."

COPY --from=build /app/prod_node_modules ./node_modules

COPY settings.js .

# Chown, install devtools & Clean up
RUN chown -R node-red:root /app && \
    /tmp/install_devtools.sh && \
    rm -r /tmp/*

USER root

# Env variables
ENV NODE_RED_VERSION=$NODE_RED_VERSION \
    NODE_PATH=/app/node_modules:/data/node_modules \
    PATH=/app/node_modules/.bin:${PATH} \
    FLOWS=flows.json

# ENV NODE_RED_ENABLE_SAFE_MODE=true    # Uncomment to enable safe start mode (flows not running)
# ENV NODE_RED_ENABLE_PROJECTS=true     # Uncomment to enable projects option

# Expose the listening port of node-red
EXPOSE 1880

# Add a healthcheck (default every 30 secs)
# HEALTHCHECK CMD curl http://localhost:1880/ || exit 1

ENTRYPOINT ["npm", "start", "--cache", "/data/.npm", "--", "--userDir", "/data", "-s", "./settings.js"]