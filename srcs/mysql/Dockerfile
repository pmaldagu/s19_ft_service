FROM alpine:3.12

MAINTAINER Pierre Maldague <pmaldagu@student.s19.be>

RUN apk update \
	&& apk add mysql mysql-client openrc

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
 
COPY ./entrypoint.sh /
COPY ./wordpress.sql /
COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY ./livenessprobe.sh /

RUN chmod +x entrypoint.sh
RUN chmod +x livenessprobe.sh

EXPOSE 3306

CMD ./entrypoint.sh
