FROM alpine:3.7

RUN apk update \
  && apk add curl bind-tools postgresql-client jq docker busybox-extras
