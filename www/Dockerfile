# https://github.com/docker-library/php/issues/506

FROM php:7.2-apache

MAINTAINER wjholden

EXPOSE 80 443

RUN apt-get update && apt-get install -y ssl-cert iputils-ping git && rm -rf /var/lib/apt/lists/*

RUN a2ensite default-ssl && a2enmod ssl

RUN printf "StrictHostKeyChecking no\nUserKnownHostsFile /dev/null\nLogLevel QUIET\nIdentityFile /id_rsa\n" >> /etc/ssh/ssh_config

COPY ./id_rsa /id_rsa
RUN chown www-data /id_rsa
RUN chmod 600 /id_rsa
