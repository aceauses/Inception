#!/bin/bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx.key -out nginx.crt -subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=Inception/CN=$DOMAIN_NAME"
chown -R www-data:www-data /var/www/html
sed -i "s/XXXXXXX/$DOMAIN_NAME/g" /etc/nginx/sites-available/default
nginx -g 'daemon off;'