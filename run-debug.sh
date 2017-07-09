#!/bin/bash

# Pull the creds down from Vault, place where Logstash can find them
/usr/bin/python /app/get_logstash_creds.py

# Transform and place the Logatash config
cat /app/logstash-config.conf | envsubst > /etc/logstash-config.conf

# Start Logstash
/opt/logstash/bin/logstash -f /etc/logstash-config.conf
