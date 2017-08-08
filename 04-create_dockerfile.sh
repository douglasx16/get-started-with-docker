### create Dockerfile with:
FROM ubuntu:latest

RUN apt-get update && apt-get install -y apache2

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_LOG_DIR  = '/var/log/apache2' \
    APACHE_RUN_GROUP= 'www-data' \
    APACHE_RUN_USER = 'www-data'

EXPOSE 80

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
