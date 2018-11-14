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
    vim \
    rabbitmq-server

RUN curl -O https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.7.8/bin/rabbitmqadmin && \
    mv rabbitmqadmin /usr/local/bin/ && chmod 755 /usr/local/bin/rabbitmqadmin