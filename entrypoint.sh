#!/bin/bash -e

# Pull the creds down from Vault, place where Logstash can find them
/usr/bin/python /app/get_logstash_creds.py

# Config test
/usr/share/logstash/bin/logstash -t -f /app/logstash-config.conf || exit 1


# Start Logstash
if [ "$1" == "debug" ]
then
  echo "Starting with debug output!"
  /usr/share/logstash/bin/logstash -f /app/logstash-config.conf
else
  echo "Starting quietly..."
  /usr/share/logstash/bin/logstash -f /app/logstash-config.conf > /dev/null 2>&1
fi
