#!/usr/bin/env sh
docker run -d \
    --name spider-mail \
    -p 25:25 \
    -p 8080:8080 \
    -p 993:993 \
    marcoshssilva/spidermail-custom:latest
