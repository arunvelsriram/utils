FROM ubuntu:trusty

RUN apt-get update \
&& apt-get install --yes --force-yes \
    curl \
    dnsutils \
    httpie \
    iputils-ping \
    jq \
    mongodb-clients \
    mysql-client \
    net-tools \
    postgresql-client \
    redis-tools \
    telnet \
    vim
