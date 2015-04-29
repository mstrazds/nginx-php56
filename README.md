<p align="center">
  <a href="http://docker.io">
    <img height="81" width="341" src="http://upload.wikimedia.org/wikipedia/commons/7/79/Docker_(container_engine)_logo.png">
  </a>
</p>
-----
# nginx-php56
A Nginx + PHP 5.6 (FPM) Base container. This container is based on the excellent [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker) base container.

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

Note that the ``/var/www/public`` is actually the root folder for serving PHP files for your web server. Having a layer back for the volume allows a bit more control over what files are visible.

### Build Folder (within repo)
The build folder contains the nginx config files as well as php-fpm settings and a setup.sh file that offloads tasks from the Dockerfile.

### Notes
Remember that PHP-FPM doesn not respect environment variables passed in the traditional manner. You will need to explicitly state what your variables are within the ``/etc/php5/fpm/pool.d/www.conf`` file.
