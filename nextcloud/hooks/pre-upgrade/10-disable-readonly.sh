#!/usr/bin/env sh
php occ config:system:set config_is_read_only false
chmod -R ug+w /var/www/html/config

