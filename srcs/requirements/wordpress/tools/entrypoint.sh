#!/bin/bash

# Name of the database host container
db_host="mariadb"

# Construct database connection variables based on .env file
db_name="${MYSQL_DATABASE}"
db_user="${MYSQL_USER}"
db_password="${MYSQL_PASSWORD}"

# Wait for the database to be ready
until mysql --host="$db_host" --port=3306 --user="$db_user" --password="$db_password" -e "USE $db_name" &> /dev/null; do
  echo "Waiting for database to start..."
  sleep 3
done

# Initialize WordPress if not already done
if [ ! -f /var/www/html/wp-config.php ]; then
  echo "WordPress not installed. Installing..."

  # 1. Download and install WordPress
  wp core download --allow-root 

  # 2. Create wp-config.php (no changes here)
  wp config create \
      --dbname="$db_name" \
      --dbuser="$db_user" \
      --dbpass="$db_password" \
      --dbhost="$db_host" \
      --allow-root

  # 3. Install WordPress with admin username check
  desired_admin_username="aceausesroot"

  while [[ $desired_admin_username =~ (admin|Admin|administrator|Administrator) ]]; do
      echo "Invalid admin username. Cannot contain 'admin', 'Admin', 'administrator', or 'Administrator'."
      read -p "Enter a different admin username: " desired_admin_username
  done

  wp core install \
      --url='aceauses.42.fr' \
      --title='TEST' \
      --admin_user="$desired_admin_username" \
      --admin_password='test' \
      --admin_email='test@test.com' \
      --allow-root

  # 4. Install and activate Twenty Twenty-One theme
  wp theme install twentytwentythree --activate --allow-root
fi

echo "WordPress initialization complete."
exec php-fpm7.4 -F 