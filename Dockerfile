FROM ubuntu:bionic

ARG UTILS_USER_GID=1000
ARG UTILS_USER_UID=1000

RUN apt-get update \
  && apt-get install --no-install-recommends --yes --force-yes \
    locales \
    bind9-host \
    curl \
    dnsutils \
    httpie \
    iputils-ping \
    jq \
    netcat-openbsd \
    mongodb-clients \
    mysql-client \
    net-tools \
    postgresql-client \
    redis-tools \
    swaks \
    telnet \
    vim \
    nano \
    wget \
    influxdb-client \
    python-setuptools \
    python-pip \
    openssh-client \
    p7zip-full \
    xz-utils \
    gnupg2 \
    kafkacat \
  && rm -rf /var/lib/apt/lists/*

# RabbitMQ tools
RUN curl -fsSL https://github.com/rabbitmq/signing-keys/releases/download/2.0/rabbitmq-release-signing-key.asc | apt-key add - \
 && echo "deb https://dl.bintray.com/rabbitmq-erlang/debian bionic erlang-23.x" > /etc/apt/sources.list.d/bintray.rabbitmq.list \
 && apt-get update \
 && apt-get install --no-install-recommends --yes --force-yes erlang-base \
 && wget -q -O rabbitmq.tar.xz https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.8.12/rabbitmq-server-generic-unix-3.8.12.tar.xz \
 && tar xf rabbitmq.tar.xz \
 && rm rabbitmq.tar.xz \
 && mv rabbitmq*/ /usr/local/rabbitmq
ENV PATH="$PATH:/usr/local/rabbitmq/sbin"
RUN curl -s -O https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.7.14/bin/rabbitmqadmin \
  && mv rabbitmqadmin /usr/local/bin/ \
  && chmod +x /usr/local/bin/rabbitmqadmin

RUN pip -q install cqlsh

RUN curl -s -O https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 \
  && mv hey_linux_amd64 /usr/local/bin/hey \
  && chmod +x /usr/local/bin/hey

RUN curl -s https://raw.githubusercontent.com/birdayz/kaf/master/godownloader.sh | BINDIR=/usr/local/bin bash

# Locale setup
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Unprivileged user setup
RUN groupadd --gid ${UTILS_USER_GID} utils \
  && useradd --uid ${UTILS_USER_UID} --gid ${UTILS_USER_GID} \
    --shell /bin/bash --create-home utils
USER utils
WORKDIR /home/utils

