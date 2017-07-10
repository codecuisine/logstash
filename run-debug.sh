#!/bin/bash

# Pull the creds down from Vault, place where Logstash can find them
/usr/bin/python /app/get_logstash_creds.py

# Transform and place the Logatash config
cat /app/logstash-config.conf | envsubst > /etc/logstash-config.conf

# Config test
# /usr/share/logstash/bin/logstash -e config.test_and_exit -f /etc/logstash-config.conf
/opt/logstash/bin/logstash -t -f /etc/logstash-config.conf

# Start Logstash
# /usr/share/logstash/bin/logstash -f /etc/logstash-config.conf > /dev/null 2>&1

/opt/logstash/bin/logstash -f /etc/logstash-config.conf
