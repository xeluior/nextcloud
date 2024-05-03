#!/usr/bin/env sh
php occ app:install richdocuments
php occ config:app:set richdocuments wopi_url --value "$OVERWRITECLIURL"
php occ config:app:set richdocuments disable_certificate_verification --value "$INSECURE_COLLABORA_SERVER"
php occ config:app:set richdocuments wopi_allowlist --value 0.0.0.0/0

