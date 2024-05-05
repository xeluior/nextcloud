#!/usr/bin/env bash

true=0
false=1

APP_ROOT=/var/www/html
CONFIG_FOLDER=$APP_ROOT/config
CUSTOM_APPS_FOLDER=$APP_ROOT/custom_apps

disable_readonly () {
  chmod -R ug+w $CONFIG_FOLDER
  php occ config:system:set config_is_read_only --type boolean --value false
}

enable_readonly () {
  php occ config:system:set config_is_read_only --type boolean --value true
  chmod -R a-w $CONFIG_FOLDER
}

install_custom_apps () {
  for app in $CUSTOMAPPS; do
    php occ app:install --keep-disabled "$app" &
  done
  wait
}

enable_all_apps () {
  for app in $CUSTOMAPPS; do
    php occ app:enable "$app"
  done
}

configure_app () {
  local app="$1"
  for option in $(printenv | grep -Po "(?<=^${app}_)[^=]+"); do
    local varname="${app}_${option}"
    local value=${!varname}
    php occ config:app:set "$app" "$option" --value "$value"
  done
}

main () {
  disable_readonly
  install_custom_apps
  for app in $CUSTOMAPPS; do
    configure_app "$app"
  done
  enable_all_apps
  enable_readonly
}

main
