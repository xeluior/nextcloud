FROM nextcloud:27.1.9-apache
COPY --chown=www-data:root --chmod=664 ./config/* /usr/src/nextcloud/config/
COPY --chown=www-data:root --chmod=555 ./hooks /docker-entrypoint-hooks.d

