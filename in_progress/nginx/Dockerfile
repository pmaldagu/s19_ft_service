FROM alpine

EXPOSE 80 443
MAINTAINER Pierre Maldague <pmaldagu@student.s19.be>

RUN apk update
RUN apk add vim
RUN apk add nginx
RUN apk add openrc
RUN apk add openssl

RUN adduser -D -g 'www' www

RUN mkdir /www
RUN mkdir -p /run/nginx

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN rm /etc/nginx/nginx.conf

COPY ./nginx.conf /etc/nginx/
COPY ./index.html /www/

RUN mkdir /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/www.pem -keyout /etc/nginx/ssl/www.key -subj "/C=BE/ST=Bxl/L=Bruxelles/O=s19/OU=pmaldagu/CN=ft_services"

RUN nginx -t

CMD nginx -g "daemon off;"
