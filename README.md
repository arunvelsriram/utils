# utils ![CI](https://github.com/arunvelsriram/utils/workflows/CI/badge.svg)

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

Using a Kubernetes Deployment:

```
kubectl create deploy utils --image=arunvelsriram/utils --replicas=1 -- sleep infinity

kubectl exec -it deploy/utils -- bash
```

**Note:** `--rm` option will delete the  `pod` after exiting from the container

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

## Contributing

Run tests:

```
$ ./run-test
```
