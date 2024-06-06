#!/bin/bash

# Name of the database host container
db_host="mariadb"

db_name="${MYSQL_DATABASE}"
db_user="${MYSQL_USER}"
db_password="${MYSQL_PASSWORD}"
sleep 10
until mysql --host="$db_host" --port=3306 --user="$db_user" --password="$db_password" -e "USE $db_name" &> /dev/null; do
	echo "Waiting for database to start..."
	sleep 3
done
cd /var/www/html

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "WordPress not installed. Installing..."

	wp core download --allow-root

	wp config create \
		--dbname="$db_name" \
		--dbuser="$db_user" \
		--dbpass="$db_password" \
		--dbhost="$db_host" \
		--allow-root

	wp core install \
		--url="$DOMAIN_NAME" \
		--title='Inception' \
		--admin_user="$WP_ADMIN_USER" \
		--admin_password="$WP_ADMIN_PASSWORD" \
		--admin_email="$WP_ADMIN_EMAIL" \
		--allow-root

	wp user create $WP_USER_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
	wp theme install twentytwentythree --activate --allow-root
fi

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
echo "WordPress initialization complete."
exec php-fpm7.4 -F