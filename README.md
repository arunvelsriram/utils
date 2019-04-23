# utils [![Build Status](https://travis-ci.org/arunvelsriram/utils.svg?branch=master)](https://travis-ci.org/arunvelsriram/utils)

Docker image with tools like curl, wget, ping, netcat, nslookup,host, dig, psql, mysql, swaks etc.

## Use Case

When using containers you might want to test the connectivity between the containers. Your application containers won't be having tools like curl, ping, psql client etc. So you can start a one-off container using this image and test your application.

For example, to run a one-off container in Kubernetes:

```
kubectl run --rm utils -it --image arunvelsriram/utils bash

# You will be seeing a bash prompt
$ psql -h hostname -U test -d test
...
...
$ exit
```

**Note:** `--rm` option will delete the `deployment` and related `pod` after exiting from the container. Skip `--rm` to preserve the `deployment` and related `pod` so that you can exec in to the `pod` and test your application any time.

## General Usage

```
$ docker pull arunvelsriram/utils
$ docker run --rm -it arunvelsriram/utils bash

# inside the container
$ ping google.com
$ ifconfig
...
$ exit
```
