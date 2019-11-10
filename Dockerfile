FROM ubuntu:18.04
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 php
ENV HTTP_DIR /var/www/html
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_DOCUMENT_ROOT $HTTP_DIR
WORKDIR $HTTP_DIR
EXPOSE 80
COPY site ./
CMD /usr/sbin/apache2ctl -D FOREGROUND
RUN apt-get -y install vim
