# SpiderMailServer Customized
this is an open-source custom image project by me ([@marcoshssilva](https://github.com/marcoshssilva))

its based on [Spider Mail Archiver](https://spiderd.io/).
Official docs [here](https://spiderd.io/docs/index.html)
---

# How to Start

> To execute, you must have Docker installed on your machine

## From Docker Hub

Run this code:
```
docker pull app-nx.marcoshssilva.com.br/x86-64/marcoshssilva/spidermail-custom:latest
docker run -d \
    --name spider-mail \
    -p 25:25 \
    -p 8080:8080 \
    -p 993:993 \
    app-nx.marcoshssilva.com.br/x86-64/marcoshssilva/spidermail-custom:latest
```


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
    image: app-nx.marcoshssilva.com.br/x86-64/marcoshssilva/spidermail-custom:latest
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
