#!/usr/bin/env bash
php occ --no-warnings app:install onlyoffice
php occ --no-warnings config:system:set onlyoffice DocumentServerUrl \
  --value="http://localhost:8081" 
php occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl \
  --value="http://onlyoffice/"
php occ --no-warnings config:system:set onlyoffice StorageUrl \
  --value="http://nextcloud/"
php occ --no-warnings config:system:set onlyoffice jwt_secret \
    --value="$OO_JWT_SECRET"
