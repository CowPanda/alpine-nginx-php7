FROM bytepark/alpine-nginx:latest

# Add PHP 7
RUN apk upgrade -U && \
    apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing add \
    php7 \
    php7-xml \
    php7-xsl \
    php7-pdo_mysql \
    php7-mcrypt \
    php7-curl \
    php7-json \
    php7-fpm \
    php7-phar \
    php7-openssl \
    php7-mysqli \
    php7-ctype \
    php7-opcache \
    php7-mbstring \
    php7-gd \
    php7-posix \
    php7-session \
    php7-intl \
    php7-openssl \
    php7-dba \
    php7-sqlite3 \
    php7-pear \
    php7-phpdbg \
    php7-litespeed \
    php7-gmp \
    php7-pdo_mysql \
    php7-pcntl \
    php7-common \
    php7-oauth \
    php7-xsl \
    php7-fpm \
    php7-gmagick \
    php7-mysqlnd \
    php7-enchant \
 php7-solr \
 php7-uuid \
 php7-pspell \
 php7-ast \
 php7-redis \
 php7-snmp \
 php7-doc \
 php7-mbstring \
 php7-lzf \
 php7-timezonedb \
 php7-dev \
 php7-xmlrpc \
 php7-stats \
 php7-embed \
 php7-xmlreader \
 php7-pdo_sqlite \
 php7-exif \
 php7-msgpack \
 php7-opcache \
 php7-ldap \
 php7-posix \
 php7-session \
 php7-gd \
 php7-gettext \
 php7-mailparse \
 php7-json \
 php7-xml \
 php7-mongodb \
 php7-iconv \
 php7-sysvshm \
 php7-curl \
 php7-shmop \
 php7-odbc \
 php7-phar \
 php7-pdo_pgsql \
 php7-imap \
 php7-pdo_dblib \
 php7-pdo_odbc \
 php7-xdebug \
 php7-apache2 \
 php7-cgi \
 php7-ctype \
 php7-inotify \
 php7-amqp \
 php7-mcrypt \
 php7-readline \
 php7-wddx \
 php7-libsodium \
 php7-bcmath \
 php7-calendar \
 php7-tidy \
 php7-dom \
 php7-sockets
 php7-zmq \
 php7-memcached \
 php7-soap \
 php7-sysvmsg \
 php7-zlib \
 php7-ftp \
 php7-sysvsem \
 php7-pdo \
 php7-bz2 \
 php7-mysqli \

COPY /rootfs /

# Small fixes
RUN ln -s /etc/php7 /etc/php && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /usr/sbin/php-fpm7 /usr/bin/php-fpm && \
    ln -s /usr/lib/php7 /usr/lib/php && \
    rm -fr /var/cache/apk/*

# Install composer global bin
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# ADD SOURCE
ONBUILD COPY ./src /usr/share/nginx/html
ONBUILD RUN chown -Rf nginx:nginx /usr/share/nginx/html

# Setup Volume
VOLUME ["/usr/share/nginx/html"]

ENTRYPOINT ["/init"]
