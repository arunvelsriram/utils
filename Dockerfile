FROM alpine

RUN apk update \
  && apk add curl wget bind-tools iputils postgresql docker
