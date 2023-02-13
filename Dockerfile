FROM ubuntu:bionic

ARG UTILS_USER_GID=1000
ARG UTILS_USER_UID=1000
ARG RABBITMQ_VERSION=3.11.9

RUN apt-get update \
  && apt-get install --no-install-recommends --yes \
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
RUN curl -1sLf "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xf77f1eda57ebb1cc" | gpg --dearmor | tee /usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg > /dev/null \
 && echo 'deb [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main' >> /etc/apt/sources.list.d/rabbitmq.list \
 && echo 'deb-src [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main' >> /etc/apt/sources.list.d/rabbitmq.list \
 && apt-get update \
 && apt-get install --no-install-recommends --yes erlang-base erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key erlang-runtime-tools erlang-snmp erlang-ssl erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl \
 && rm -rf /var/lib/apt/lists/* \
 && wget -q -O rabbitmq.tar.xz https://github.com/rabbitmq/rabbitmq-server/releases/download/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz \
 && tar xf rabbitmq.tar.xz \
 && rm rabbitmq.tar.xz \
 && mv rabbitmq*/ /usr/local/rabbitmq
ENV PATH="$PATH:/usr/local/rabbitmq/sbin"
RUN curl -s -O https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v${RABBITMQ_VERSION}/deps/rabbitmq_management/bin/rabbitmqadmin \
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

