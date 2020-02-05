FROM php:fpm-alpine3.10 as php

RUN docker-php-ext-install pdo_mysql

CMD ["php-fpm"]

EXPOSE 9000