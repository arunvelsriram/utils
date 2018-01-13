FROM ubuntu:16.04

RUN apt-get update \
  && apt-get -y install curl wget dnsutils iputils-ping telnet postgresql
RUN curl -sSL https://get.docker.com/ | sh
