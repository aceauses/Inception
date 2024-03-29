FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]