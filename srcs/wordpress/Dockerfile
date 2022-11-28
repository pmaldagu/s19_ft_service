FROM alpine:3.12

MAINTAINER Pierre Maldague <pmaldagu@student.s19.be>

RUN apk update \
	&& apk add wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session nginx

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN mkdir /www

RUN wget https://wordpress.org/wordpress-5.2.9.tar.gz \
	&& tar -xvf wordpress-5.2.9.tar.gz \
	&& mv wordpress/* /www 

COPY ./wp-config.php /www/wp-config.php
COPY ./entrypoint.sh /
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY ./nginx.conf /etc/nginx/

RUN chmod +x entrypoint.sh
EXPOSE 5050

CMD ./entrypoint.sh
