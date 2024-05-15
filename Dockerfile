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
    python3-setuptools \
    python3-pip \
    openssh-client \
    p7zip-full \
    xz-utils \
    gnupg2 \
    kafkacat \
    tcpdump \
    ngrep \
    nmap \
  && rm -rf /var/lib/apt/lists/*

RUN echo "Erlang PPA setup" \
 && curl -1sLf "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xf77f1eda57ebb1cc" | gpg --dearmor | tee /usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg > /dev/null \
 && echo 'deb [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main' >> /etc/apt/sources.list.d/rabbitmq.list \
 && echo 'deb-src [signed-by=/usr/share/keyrings/net.launchpad.ppa.rabbitmq.erlang.gpg] http://ppa.launchpad.net/rabbitmq/rabbitmq-erlang/ubuntu bionic main' >> /etc/apt/sources.list.d/rabbitmq.list \
 && echo "MongoDB Shell PPA setup" \
 && wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | tee /etc/apt/trusted.gpg.d/server-7.0.asc \
 && echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse' | tee /etc/apt/sources.list.d/mongodb-org-7.0.list \
 && apt-get update \
 && apt-get install --no-install-recommends --yes erlang-base erlang-asn1 erlang-crypto erlang-eldap erlang-ftp erlang-inets erlang-mnesia erlang-os-mon erlang-parsetools erlang-public-key erlang-runtime-tools erlang-snmp erlang-ssl erlang-syntax-tools erlang-tftp erlang-tools erlang-xmerl \
 && apt-get install --no-install-recommends --yes mongodb-mongosh \
 && rm -rf /var/lib/apt/lists/*

RUN wget -q -O rabbitmq.tar.xz https://github.com/rabbitmq/rabbitmq-server/releases/download/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz \
 && tar xf rabbitmq.tar.xz \
 && rm rabbitmq.tar.xz \
 && mv rabbitmq*/ /usr/local/rabbitmq
ENV PATH="$PATH:/usr/local/rabbitmq/sbin"

RUN curl -s -O https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v${RABBITMQ_VERSION}/deps/rabbitmq_management/bin/rabbitmqadmin \
  && mv rabbitmqadmin /usr/local/bin/ \
  && chmod +x /usr/local/bin/rabbitmqadmin

RUN pip3 install cqlsh

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
