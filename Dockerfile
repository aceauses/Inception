FROM debian:bullseye

RUN apt update \
	&& apt install -y nginx openssl \
	&& apt clean \
	&& mkdir /etc/nginx/ssl/

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf
COPY conf/nginx-entry.sh .

RUN chmod +x ./nginx-entry.sh

EXPOSE 443

ENTRYPOINT [ "./nginx-entry.sh" ]
