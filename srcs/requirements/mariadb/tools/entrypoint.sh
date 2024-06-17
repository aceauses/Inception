#!/bin/bash

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

mkdir /run/mysqld
chown -R mysql:mysql /run/mysqld
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)
MYSQL_PASSWORD=$(cat /run/secrets/db_password)

if [ ! -f /database.sql ]; then
	echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" > database.sql
	echo "FLUSH PRIVILEGES;" >> database.sql
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> database.sql
	echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> database.sql
	echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> database.sql
	echo "FLUSH PRIVILEGES;" >> database.sql
fi

exec mariadbd --no-defaults --user=root --init-file=/database.sql --datadir=/var/lib/mysql