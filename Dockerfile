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

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN curl -O https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.7.8/bin/rabbitmqadmin && \
    mv rabbitmqadmin /usr/local/bin/ && chmod +x /usr/local/bin/rabbitmqadmin