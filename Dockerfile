FROM phpswoole/swoole:4.7-php7.4-alpine

# Copy PHP extensions installer script
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# Install necessary PHP extensions
RUN install-php-extensions pcntl ioncube

# Install additional packages including shadow, supervisor, nginx, etc.
RUN apk --no-cache add shadow supervisor nginx sqlite nginx-mod-http-brotli mysql-client git

# Set the working directory
WORKDIR /www

# Copy necessary files
COPY .docker /
COPY . /www

# Download and install IonCube Loader
RUN wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
&& tar xvzf ioncube_loaders_lin_x86-64.tar.gz \
&& mv ioncube/ioncube_loader_lin_8.1.so `php-config --extension-dir` \
&& rm -rf ioncube ioncube_loaders_lin_x86-64.tar.gz \
&& echo "zend_extension=ioncube_loader_lin_8.1.so" > /usr/local/etc/php/conf.d/00-ioncube.ini

# Install Composer dependencies
RUN composer install --optimize-autoloader --no-cache --no-dev \
&& php artisan storage:link \
&& chmod -R 777 ./

# Set the command to run the supervisor
CMD [ "/usr/bin/supervisord", "--nodaemon", "-c" ,"/etc/supervisor/supervisord.conf" ]
