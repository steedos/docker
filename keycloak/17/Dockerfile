ARG KEYCLOAK_VERSION=17.0.0

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
# ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres

RUN curl -sL https://github.com/steedos/keywind/raw/master/steedos-theme.jar -o /opt/keycloak/providers/steedos-theme.jar

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]