#!/usr/bin/bash

echo 'Prepare Certificate Authority...'
openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout RootCA.key -out RootCA.pem -subj "/C=BR/CN=marcoshssilva-CA"

echo 'Preparing signature...'
cat << EOT >> domains.ext
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = localhost
DNS.2 = *.localhost
DNS.3 = *.dev.localhost
DNS.4 = *.staging.localhost
DNS.5 = *.test.localhost
DNS.6 = *.mail.localhost
EOT

echo 'Exporting CA...'
openssl x509 -outform pem -in RootCA.pem -out RootCA.crt

echo 'Create localhost private and public keys...'
openssl req -new -nodes -newkey rsa:2048 -keyout localhost.key -out localhost.csr -subj "/C=BR/CN=localhost"

echo 'Create localhost certificate...'
openssl x509 -req -sha256 -days 1024 -in localhost.csr -CA RootCA.pem -CAkey RootCA.key -CAcreateserial -extfile domains.ext -out localhost.crt

echo 'OK.'