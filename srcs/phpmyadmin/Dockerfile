FROM alpine:3.12

MAINTAINER Pierre Maldague <pmaldagu@student.s19.be>

RUN	apk update \
	&&	apk	add	php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php-json php-mbstring nginx

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
	&& tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
	&& rm phpMyAdmin-4.9.0.1-all-languages.tar.gz \
	&& mv phpMyAdmin-4.9.0.1-all-languages Phpmyadmin

Run mkdir /www
RUN mv Phpmyadmin/* /www/
RUN mkdir -p /run/phpMyadmin

COPY ./config.inc.php /www/config.inc.php
COPY ./entrypoint.sh /
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY ./nginx.conf /etc/nginx/

RUN chmod +x entrypoint.sh
EXPOSE 5000

CMD ./entrypoint.sh
