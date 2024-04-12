#!/bin/bash

# Give ownership of the WordPress files to the Nginx user
chown -R www-data:www-data /var/www/html

nginx -g 'daemon off;'