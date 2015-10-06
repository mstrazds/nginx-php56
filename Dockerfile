FROM phusion/baseimage:0.9.17

# Phusion setup
ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

CMD ["/sbin/my_init"]

# Nginx-PHP Installation
RUN apt-get update -y && apt-get install -y vim curl wget build-essential python-software-properties git-core
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4F4EA0AAE5267A6C
RUN add-apt-repository -y ppa:ondrej/php5-5.6 && add-apt-repository -y ppa:nginx/stable
RUN apt-get update -y && sudo apt-get upgrade -y && apt-get install -y php5 php5-cli php5-fpm php5-mysqlnd php5-curl \
					php5-gd php5-mcrypt php5-intl php5-imap php5-tidy php-pear php5-xmlrpc

# Install latest version of nodejs
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
RUN apt-get install -y nodejs

# Install nginx (full)
RUN apt-get install -y nginx-full

# Install ntpd
RUN apt-get install -y ntp

# Add build script
RUN mkdir -p /root/setup
ADD build/setup.sh /root/setup/setup.sh
RUN chmod +x /root/setup/setup.sh
RUN (cd /root/setup/; /root/setup/setup.sh)

# Copy files from repo
ADD build/default /etc/nginx/sites-available/default
ADD build/nginx.conf /etc/nginx/nginx.conf
ADD build/php-fpm.conf /etc/php5/fpm/php-fpm.conf
ADD build/www.conf /etc/php5/fpm/pool.d/www.conf

# Add startup scripts for services
ADD build/nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

ADD build/phpfpm.sh /etc/service/phpfpm/run
RUN chmod +x /etc/service/phpfpm/run

ADD build/ntp.sh /etc/service/ntp/run
ADD build/ntp.conf /etc/ntp.conf
RUN chmod +x /etc/service/ntp/run

# Set WWW public folder
RUN mkdir -p /var/www/public
ADD build/index.php /var/www/public/index.php

RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www

# Port and settings
EXPOSE 80

# Cleanup apt and lists
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
