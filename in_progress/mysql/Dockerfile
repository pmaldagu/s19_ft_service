FROM alpine

EXPOSE 80 443
MAINTAINER Pierre Maldague <pmaldagu@student.s19.be>

RUN apk update
RUN apk upgrade
RUN apk add vim
RUN apk add mysql mysql-client && mariadb mariadb-client && rm -rf /var/cache/apk/*
#Add database to the created container
COPY wordpress_database.sql .

EXPOSE 3306
