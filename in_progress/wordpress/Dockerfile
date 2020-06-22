FROM alpine

#Install php?
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

#Get wordpress through zip
RUN wget https://wordpress.org/latest.tar.gz
#x for extract archive, v verbal display info, f use archive file
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz
RUN mkdir /www
RUN mv wordpress/* /www
RUN mkdir -p /run/wordpress

EXPOSE 5050

#Command to easily build web server hosting wordpress
CMD php -S 0.0.0.0:5050 -t /www/
#CMD for a shell command with multiple parameters
#php to launch php code
# -S to start built-in web server on the given local address and port
#php [options] -S addr:port [-t docroot]
