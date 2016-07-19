FROM alpine:latest

# Install packages
RUN apk --update add php7 php7-xml php7-mcrypt php7-curl php7-json php7-mongodb php7-ctype php7-iconv php7-session  php7-xdebug  php7-memcached php7-pdo php7-fpm nginx supervisor --repository http://nl.alpinelinux.org/alpine/edge/testing/

# Configure nginx
COPY config/nginx.conf /etc/nginx/nginx.conf

# Configure PHP-FPM
COPY config/fpm-pool.conf /etc/php7/php-fpm.d/custom.conf
COPY config/php.ini /etc/php7/conf.d/custom.ini

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add application
RUN mkdir -p /var/www/html
WORKDIR /var/www/html
#COPY src/ /var/www/html/

EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
