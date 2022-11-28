FROM alpine:3.12

MAINTAINER Pierre Maldague <pmaldagu@student.s19.be>

RUN apk update

RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

RUN apk add grafana --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./grafana.db /usr/share/grafana/data/

COPY ./telegraf.conf /etc/telegraf/telegraf.conf
COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

EXPOSE 3000

CMD ./entrypoint.sh
