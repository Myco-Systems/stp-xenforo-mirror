FROM php:8.1-fpm-alpine3.16

RUN apk update

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions openssl exif gd xdebug mysqli imagick gmp zip
