## 1.1.4 (release date: 2017-12-05)

 * Added zip unzip php5.6-zip to installer

## 1.1.3 (release date: 2017-12-05)

 * Removed NVM installer
 * Removed NVM ENV settings
 * Removed Node.js from build
 * Updated `phusion/baseimage` to `0.9.22`
 * Updated localtime to symlink with UTC

## 1.1.2 (release date: 2017-01-18)

 * Added `vim` and `nano` to install

## 1.1.1 (release date: 2017-01-17)

 * Patched ntpd so that invalid `-s` switch is removed

## 1.1.0 (release date: 2017-01-17)

 * Updated nginx conf sendfile default to 'off'
 * Updated NVM version to `0.33.0`
 * Updated Node.js to version `6.9.4 LTS`
 * Added synchronise on start to the ntp daemon
 * Added `www` folder and moved index.php
 * Added `docker-compose.yml` for easy setup
 * Update PECL channel listing

## 1.0.3 (release date: 2016-11-22)

 * Updated newrelic script path

## 1.0.2 (release date: 2016-11-21)

 * Removed php-pear module due to PHP7.0 incompatibility

## 1.0.1 (release date: 2016-11-21)

 * Added changelog

## 1.0.0 (release date: 2016-11-21)

 * Updated `phusion/baseimage` to `0.9.19`
 * Replaced apt-get package source to ppa:ondrej/php
 * Updated all packages to adhere to ppa:ondrej/php
 * Modified settings file to comply with 5-5.6 naming conventions

## 0.12.0 (release date: 2016-06-06)

 * Reverted back to ppa:ondrej/php5-5.6 as NR doesn't support 7.0

## 0.11.0 (release date: 2016-06-03)

 * Replaced apt-get package source to ppa:ondrej/php

## 0.10.0 (release date: 2016-05-24)

 * Bumped to workaround docker hub issue

## 0.9.7.1 (release date: 2016-02-11)

 * Updated Newrelic Script

## 0.9.6 (release date: 2016-01-11)

 * Bugfix moved layers around for node `0.12.10`

## 0.9.5 (release date: 2016-01-11)

 * Updated NVM to switch to node `0.12.10`

## 0.9.4 (release date: 2016-01-11)

 * Bugfix for removing multiple newrelic instances
 * Bugfix for newrelic install fails gracefully

## 0.9.3 (release date: 2016-01-10)

 * Removed latest version of nodejs installation
 * Updated `phusion/baseimage` to `0.9.18`
 * Added NVM `0.30.2` for switching node to `0.10.37`
 * Added New Relic APM setup script for monitoring
 * Added HTTPS configuration with generated certificate
 * Added system timezone setting to: "Australia/Sydney"

## 0.9.2 (release date: 2015-11-30)

 * Added PostgreSQL Support
 * Added XTERM environment support w/colors

## 0.9.1 (release date: 2015-10-07)

 * Removed stale NTP entries
 * Updated `phusion/baseimage` to `0.9.17`
 * Added latest version of nodejs installation `v4.1.2`

## 0.9.0 (release date: 2015-10-06)

 * Initial release
