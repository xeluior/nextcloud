#!/usr/bin/env sh
php occ config:app:set core backgroundjobs_mode --value cron
php occ config:system:set maintenance_window_start --type=integer --value=4
