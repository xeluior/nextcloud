#!/usr/bin/env sh
php occ config:system:set appstoreenabled false
php occ config:system:set config_is_read_only true
chmod -R a-w /var/www/html/config

