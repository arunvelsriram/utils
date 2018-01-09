# utils
Docker image with tools like curl, wget, ping, nslookup, dig, psql etc.

## Usage

```
$ docker pull arunvelsriram/utils
$ docker run --rm -it arunvelsriram/utils sh

# inside the container
$ ping google.com
$ ifconfig
...
$ exit
```
