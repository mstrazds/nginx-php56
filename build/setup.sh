#!/usr/bin/env bash

##-------------------------------------------------------
# UPDATE CONFIG FILES
##-------------------------------------------------------

# Set timezone to UTC
sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/fpm/php.ini
sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini

# Setup php-fpm to not run as daemon (allow my_init to control)
sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini

# Setup permissions for php5-fpm
sed -i '/^;listen.mode = .*/alisten.mode = 0660' /etc/php5/fpm/pool.d/www.conf
sed -i '/^listen.mode = .*/alisten.owner = www-data' /etc/php5/fpm/pool.d/www.conf
sed -i '/^listen.mode = .*/alisten.group = www-data' /etc/php5/fpm/pool.d/www.conf

##-------------------------------------------------------
# UPDATE FILES AND FOLDERS
##-------------------------------------------------------

# Add required php5-fpm folders
mkdir -p /var/run/php5-fpm && chown -R www-data:www-data /var/run/php5-fpm
mkdir -p /var/log/php5-fpm && chown -R www-data:www-data /var/log/php5-fpm
