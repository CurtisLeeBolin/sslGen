#!/bin/bash
# sslGen.sh
#
# Instructions:
# ./sslGen.sh <domain>

domain=$1

openssl req -new -x509 -extensions v3_req -newkey rsa:8192 -nodes -days 3650 \
  -subj "/O=$domain/CN=*.$domain/subjectAltName=DNS:*.$domain/" \
  -out $domain.crt -keyout $domain.key
chmod 600 $domain.key
