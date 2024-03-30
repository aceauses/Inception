#!/bin/bash
mysql_install_db
mysql start

mkdir /run/mysqld
chown -R mysql:mysql /run/mysqld

echo "CREATE DATABASE IF NOT EXISTS $db_name;" > database.sql
echo "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_password';" >> database.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';" >> database.sql
echo "FLUSH PRIVILEGES;" >> database.sql

mysql -u root < database.sql

killall mysqld
mysqld
