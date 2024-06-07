#!/bin/bash

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mkdir /run/mysqld
chown -R mysql:mysql /run/mysqld

# Create database and user if they don't exist
if ! mysql -u root --password="$MYSQL_ROOT_PASSWORD" -e "USE $MYSQL_DATABASE" >/dev/null 2>&1; then
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > database.sql
    echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> database.sql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> database.sql
    echo "FLUSH PRIVILEGES;" >> database.sql

    mysql -u root --password="$MYSQL_ROOT_PASSWORD" < database.sql
fi

killall mysqld

mysqld