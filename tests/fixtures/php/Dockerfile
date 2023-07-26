FROM php:8.0.29-apache-bullseye

RUN docker-php-ext-install mysqli pdo pdo_mysql

COPY mysql.php /var/www/html/mysql.php
