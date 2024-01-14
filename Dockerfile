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

# Install Composer dependencies
RUN composer install --optimize-autoloader --no-cache --no-dev \
&& php artisan storage:link \
&& chmod -R 777 ./

# Set the command to run the supervisor
CMD [ "/usr/bin/supervisord", "--nodaemon", "-c" ,"/etc/supervisor/supervisord.conf" ]
