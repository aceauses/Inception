FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y && apt-get clean
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
EXPOSE 3306
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
COPY ./tools/health_check.sh /usr/local/bin/health_check.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/health_check.sh
CMD ["/usr/local/bin/entrypoint.sh"]