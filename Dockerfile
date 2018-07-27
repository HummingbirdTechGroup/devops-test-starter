FROM php:7.2.6-apache
MAINTAINER HummingbirdTech

LABEL version="0.0.1"
LABEL description="HummingbirdTech DevOps test starter"

RUN apt-get update && apt-get install -y git zlib1g-dev netcat && docker-php-ext-install pdo pdo_mysql && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install pdo pdo_mysql && a2enmod rewrite && echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY docker/vhost.conf /etc/apache2/sites-enabled/000-default.conf
COPY docker/docker-entrypoint.sh /usr/local/bin/

COPY . /app
ADD https://getcomposer.org/composer.phar /app/composer.phar
WORKDIR /app

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
