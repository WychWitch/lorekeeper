FROM php:7.4-apache

RUN apt-get update && apt-get install -y libxml2-dev libzip-dev libonig-dev libcurl4-openssl-dev libpng-dev && docker-php-ext-install bcmath mbstring json mysqli tokenizer xml zip curl gd xml zip pdo pdo_mysql

ENV APACHE_DOCUMENT_ROOT /var/www/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN a2enmod rewrite
