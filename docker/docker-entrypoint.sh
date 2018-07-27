#!/usr/bin/env bash

if [ $1 == "apache2-foreground" ]; then
    export SYMFONY_SECRET="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"
    php composer.phar install -o -n --prefer-source
    chown www-data:www-data -R /app

    # Ensure the database is up and running
    nc -z "${SYMFONY_DATABASE_HOST}" "${SYMFONY_DATABASE_PORT}"
    while [[ $? -ne 0 ]]; do
        nc -z "${SYMFONY_DATABASE_HOST}" "${SYMFONY_DATABASE_PORT}"
    done

    php bin/console doctrine:schema:update --force
    php bin/console doctrine:query:sql "$(cat docker/farms.sql)"
fi

docker-php-entrypoint "$@"
