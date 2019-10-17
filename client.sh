#!/usr/bin/env bash

# PASSWORD='12345678Afz'
# NODE_IP='192.168.1.111'

# echo $PASSWORD
echo "start report ip "$NODE_IP
HEADER_KEY='x-node-ip'
ENCRYPTED_VALUE=$(echo ${NODE_IP} | openssl aes-128-cbc -k ${PASSWORD} -base64)

curl -X POST -H"${HEADER_KEY}: ${ENCRYPTED_VALUE}" http://127.0.0.1:8080
