FROM ubuntu:bionic

RUN apt-get update \
  && apt-get install --no-install-recommends --yes --force-yes  \
    locales \
    curl \
    dnsutils \
    netcat-openbsd \
    bind9-host \
    swaks \
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
    influxdb-client \
    rabbitmq-server

RUN curl -O https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.7.8/bin/rabbitmqadmin \
  && mv rabbitmqadmin /usr/local/bin/ \
  && chmod +x /usr/local/bin/rabbitmqadmin

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
