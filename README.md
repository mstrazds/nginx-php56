<p align="center">
  <a href="http://docker.io">
    <img height="81" width="341" src="http://upload.wikimedia.org/wikipedia/commons/7/79/Docker_(container_engine)_logo.png">
  </a>
</p>
-----
# nginx-php56
A Nginx + PHP 5.6 (FPM) Base container. This container is based on the excellent [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker) base container. You can find the docker automated build [here](https://registry.hub.docker.com/u/mstrazds/nginx-php56/).

### Services
All services are defined and managed using the phusion/baseimage methodology. Logs are output using syslog and can be accessed using ``docker logs {container}``.

* Nginx
* PHP-FPM (5.6)

### Default Settings
The container sets up a www root folder in the following location:

``/var/www/public``

As a final task a demo index.php is copied to this location.

### Volumes
The following folder is specified as a volume:

``/var/www/``

Note that the ``/var/www/public`` is the root folder for serving PHP files for your web server. Having a layer (folder) back for the volume allows a bit more flexibility on file visibility.

### Build Folder (within repo)
Contains nginx config files as well as php-fpm settings. Also include setup.sh file that offloads tasks from the Dockerfile to reduce layers.

### Notes
Remember that PHP-FPM doesn not respect environment variables passed in the traditional manner. You will need to explicitly state what your variables are within the ``/etc/php5/fpm/pool.d/www.conf`` file.
