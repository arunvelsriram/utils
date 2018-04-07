# utils

Docker image with tools like curl, wget, ping, nslookup, dig, psql, mysql etc.

## Use Case

When running a cluster ([Kubernetes](https://kubernetes.io/) in my case) you might want to test the connectivity between containers, connectivity to a private docker registry and artifactory, Postgres connection, etc. Your application containers won't be having tools like curl, ping, psql client etc. So you can pull this image and use the available tools to test your application.

For example, in Kubernetes one can do:

```
kubectl run utils --rm -it --image arunvelsriram/utils bash

# You will be seeing a bash prompt
$ psql -h hostname -U test -d test
...
...
$ exit
```

to quickly spawn a `deployment` called `utils` and use the tools provided by the image.

Once you `exit` from `bash`, the `deployment` will be deleted from the cluster automatically.

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
