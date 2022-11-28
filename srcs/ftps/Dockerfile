FROM alpine:3.12

MAINTAINER Pierre Maldague <pmaldagu@student.s19.be>

RUN apk update \
	&& apk add openssl

RUN  apk add --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ pure-ftpd

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN adduser -D pmaldagu
RUN echo "pmaldagu:pmaldagu" | chpasswd

RUN mkdir -p /etc/ssl/private/

RUN openssl req -x509 -nodes -days 365 -subj "/C=BE/ST=BX/L=Belgique/O=19/CN=pmaldagu" -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

COPY ./entrypoint.sh /
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

RUN chmod +x entrypoint.sh

EXPOSE 21 21000 21001 21002 21003 21004

CMD ./entrypoint.sh
