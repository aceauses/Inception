#!/bin/bash

chown -R www-data:www-data /var/www/html
sed -i "s/XXXXXXX/$DOMAIN_NAME/g" /etc/nginx/sites-available/default
nginx -g 'daemon off;'