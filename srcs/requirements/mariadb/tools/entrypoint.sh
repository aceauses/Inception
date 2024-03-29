#!/bin/bash

# # Modify MariaDB configuration (assuming config file at /etc/my.cnf)
# ls /etc/mysql/mariadb.conf.d/
# sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Start the MariaDB server
exec mysqld --skip-innodb --user=mysql --console