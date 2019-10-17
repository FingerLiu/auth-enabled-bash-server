#!/usr/bin/env bash

echo "server started..."

PASSWORD='12345678Afz'
WATCHED_HOST_GROUP='dev'

while read x ;
do
	echo $x ;
	scan=`echo $x|grep x-node-ip`
        if [ $? -eq 0 ]; then
		ENCRYPTED_IP=$(echo $scan|cut -d ' ' -f2|dos2unix)
        IP=$(echo ${ENCRYPTED_IP} | openssl aes-128-cbc -d -k ${PASSWORD} -base64)
		echo $IP
		sed -i 's/\(\['${WATCHED_HOST_GROUP}'1\].*\)/\1'"\n$IP\n/" ./hosts
	fi
done
