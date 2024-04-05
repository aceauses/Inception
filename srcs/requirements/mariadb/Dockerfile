FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y && apt-get clean
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
EXPOSE 3306
CMD ["/usr/local/bin/entrypoint.sh"]