#!/usr/bin/env bash

##--------------------------------------------------------
# CHECK IF NV_INSTALL_KEY IS NOT DEFAULT TO INSTALL NR APM
##--------------------------------------------------------

if [ "$NR_INSTALL_KEY" = "**ChangeMe**" ]; then
    echo "Skipping New Relic Setup..."
else
    echo "New Relic NR_INSTALL_KEY detected..."
    echo "Enabling APM metrics for ${NR_APP_NAME}"
    newrelic-install install

    # Update the application name
    sed -i "s/newrelic.appname = \"PHP Application\"/newrelic.appname = \"${NR_APP_NAME}\"/" /etc/php5/fpm/conf.d/newrelic.ini

    # Remove extra new relic config file (causes log spamming)
    rm /etc/php5/cli/conf.d/newrelic.ini
fi
