#!/bin/bash

# Initialize data directory if it's empty
if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mkdir /run/mysqld
chown -R mysql:mysql /run/mysqld

# Start MySQL in the background initially 
mysqld &
sleep 5  # Wait for MySQL server to initialize

echo "ALL VARIABLES:"
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
echo "MYSQL_ROOT_PASSWORD: $MYSQL_ROOT_PASSWORD"

# Create database and user if they don't exist
if ! mysql -u root --password="$MYSQL_PASSWORD" -e "USE $MYSQL_DATABASE" >/dev/null 2>&1; then
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > database.sql
    echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> database.sql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> database.sql
    echo "FLUSH PRIVILEGES;" >> database.sql

    mysql -u root --password="$MYSQL_PASSWORD" < database.sql
fi

# Stop the background initialization process
killall mysqld 

# Start MySQL in the foreground for normal operation 
mysqld