#!/bin/sh

echo "Starting PHP-FPM"

if [ ! -d /run/php-fpm ]; then
    mkdir /run/php-fpm
fi

php-fpm -c /etc/php-fpm.conf