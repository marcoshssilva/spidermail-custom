#!/usr/bin/env sh
openssl genrsa -out secret.key -des3 2048
chmod 0755 secret.key
openssl req -x509 -sha256 -new -nodes -days 3650 -key secret.key -out cert.pem