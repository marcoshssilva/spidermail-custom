FROM iredmail/spider:latest

COPY certs/localhost.crt /opt/spider/cert.pem
COPY certs/localhost.key /opt/spider/secret.key
COPY certs/settings.json /opt/spider/settings.json
