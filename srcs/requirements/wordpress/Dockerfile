FROM debian:bullseye

RUN apt-get update && apt-get install -y php-fpm

RUN apt-get update -y && apt-get install -y \
    mariadb-client \
    curl \
    wget \
    php \
    php-fpm \
    php-mysql \
    php-cli \
    php-cgi \
    php-pdo \
    php-mbstring && apt-get clean

# Download and install WordPress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

WORKDIR /var/www/html
EXPOSE 9000

RUN ["chmod", "+x", "/usr/bin/php"]

COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
