FROM debian:bullseye

# Install the required packages for the wordpress server
RUN apt-get update -y && apt-get install -y \
    curl \
    wget \
    php \
    php-fpm \
    php-mysql \
    php-cgi \
    php-pdo \
    php-mbstring

# Download and install the latest version of wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
