# docker-bashCMS

## Usage

```
$ docker pull youpy/bashcms

# If you use boot2docker
$ ssh localhost -l docker -p 2022 -i ~/.ssh/id_boot2docker -L 49153:localhost:49153

$ docker run --privileged -p 80 youpy/bashcms apachectl -DFOREGROUND

# open http://localhost:49153/
```

