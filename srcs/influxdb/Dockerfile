FROM alpine:3.12

MAINTAINER Pierre Maldague <pmaldagu@student.s19.be> 

RUN apk update \
	&&	apk add influxdb curl

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./entrypoint.sh /
COPY ./livenessprobe.sh /
COPY ./telegraf.conf etc/telegraf/telegraf.conf

RUN chmod +x entrypoint.sh
RUN chmod +x livenessprobe.sh

EXPOSE 8086

CMD ./entrypoint.sh
