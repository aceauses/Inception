FROM debian:bullseye

RUN apt-get update -y && apt-get install -y nginx openssl && apt-get clean
COPY ./conf/default.conf /etc/nginx/sites-available/default

EXPOSE 443
COPY ./tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]