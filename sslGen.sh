#!/bin/bash
# sslGen.sh
#
# Instructions:
# ./sslGen.sh [domain]

if [ -n "$1" ]; then
  domain="$1"
  mkdir $domain
  openssl req -new -x509 -extensions v3_req -newkey rsa:8192 -nodes -days 3650 \
    -subj "/O=$domain/CN=*.$domain/subjectAltName=DNS:*.$domain/" \
    -out $domain/cert.pem -keyout $domain/cert.key
  openssl dhparam -out $domain/dhparam 2048
  chmod 600 $domain/cert.key
else
  openssl req -new -x509 -extensions v3_req -newkey rsa:8192 -nodes -days 3650 \
    -subj "/O=/CN=/" \
    -out cert.pem -keyout cert.key
  openssl dhparam -out dhparam 2048
  chmod 600 cert.key
fi
