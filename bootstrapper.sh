#!/bin/bash

# Pull the creds down from Vault, place where Logstash can find them
/usr/bin/python /app/get_logstash_creds.py

# Config test
/usr/share/logstash/bin/logstash -t -f /app/logstash-config.conf || exit 1
cp /app/logstash-config.conf /etc/logstash-config.conf


# Start Logstash
/usr/share/logstash/bin/logstash -f /etc/logstash-config.conf > /dev/null 2>&1
