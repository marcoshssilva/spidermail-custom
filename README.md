# SpiderMailServer Customized
this is a custom image project by me ([@marcoshssilva](https://github.com/marcoshssilva))

its based on [Spider Mail Archiver](https://spiderd.io/). Official docs [here](https://spiderd.io/docs/index.html)

---

# How to Start

> To execute, you must have Docker installed on your machine

## From clone this repository

Run this script:
```
git clone git@github.com:marcoshssilva/custom-spider-mail.git
cd custom-spider-mail
sh build-image.sh
sh run-local.sh
```

## Docker compose example

```
version: '3.3'
services:
  spider-mail:
    image: marcoshssilva/spidermail-custom:latest
    restart: on-failure
    ports:
      - 25:25
      - 993:993
      - 8080:8080
    volumes:
      - spider-data:/opt/spider
    networks:
      - spider-network
volumes:
  spider-data:
networks:
  spider-network:
    driver: bridge
```
