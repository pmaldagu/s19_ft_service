FROM alpine:3.12

MAINTAINER Pierre Maldague <pmaldagu@student.s19.be>

RUN apk update \
	&& apk add openrc openssl nginx

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN adduser -D -g 'www' www

RUN mkdir /www \
	&& 	mkdir -p /run/nginx \
	&&	chown -R www:www /var/lib/nginx \
	&&	chown -R www:www /www

RUN rm /etc/nginx/nginx.conf
COPY ./nginx.conf	/etc/nginx/
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY ./index.html /var/www/localhost
COPY ./entrypoint.sh /

RUN mkdir /etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 7300 -subj "/C=BE/ST=Brussels/O=20/OU=pmaldagu/CN=www.localhost" -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt


EXPOSE 22 80 443

RUN chmod +x entrypoint.sh

CMD ./entrypoint.sh 
