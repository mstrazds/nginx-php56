#!/usr/bin/env bash
set -e

echo "Enabling APM metrics for ${NR_APP_NAME}"
newrelic-install install

# Update the application name
sed -i "s/newrelic.appname = \"PHP Application\"/newrelic.appname = \"${NR_APP_NAME}\"/" /etc/php5/fpm/conf.d/newrelic.ini
