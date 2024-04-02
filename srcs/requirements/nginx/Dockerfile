FROM debian:bullseye

RUN apt-get update -y && apt-get install -y nginx -y && apt-get clean

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf 

CMD ["nginx", "-g", "daemon off;"]