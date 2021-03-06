FROM java:8

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_RUN_DIR /var/run/apache2

RUN apt-get update
RUN apt-get install fuse -y
RUN apt-get install -y apache2 apache2-utils

RUN a2enmod dav dav_fs
RUN a2dissite 000-default
RUN mkdir -p /var/lock/apache2; chown www-data /var/lock/apache2
RUN mkdir -p /var/webdav; chown www-data /var/webdav

ADD webdav.conf /etc/apache2/sites-available/webdav.conf
RUN a2ensite webdav
ADD run.sh /

COPY target /tmp/jnr-target
COPY run.sh /

EXPOSE 80

WORKDIR /
CMD sh run.sh