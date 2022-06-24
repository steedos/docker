FROM quay.io/keycloak/keycloak:18.0.1 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
# ENV KC_FEATURES=token-exchange
ENV KC_DB=postgres

RUN curl -sL https://github.com/steedos/keywind/raw/master/steedos-theme.jar -o /opt/keycloak/providers/steedos-theme.jar

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:18.0.1
COPY --from=builder /opt/keycloak/ /opt/keycloak/
WORKDIR /opt/keycloak

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]