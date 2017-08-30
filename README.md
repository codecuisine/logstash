# Logstash container for SITCH
## Making things just a little bit easier.

Needs these env vars:

| var            | purpose                       |
|----------------|-------------------------------|
| ES_URL         | Elasticsearch URL             |
| INFLUXDB_HOST  | InfluxDB hostname or IP       |
| INFLUXDB_PORT  | InfluxDB port                 |
| SLACK_WEBHOOK  | Webhook for posting to Slack  |
| SLACK_USERNAME | Username for Slack messages   |
| SLACK_ICON     | Icon for Slack messages       |
| VAULT_URL      | URL for accessing vault       |
| VAULT_TOKEN    | Token for accessing vault     |

Build and fire it up daemonized, and you should be off and running.  Check the
logs for your container a few minutes after you start it to make sure your
settings are sane.  Logstash is pretty good about making eloquent complaints
when it's unhappy.

Here's how you run it, once your environment vars are set:

        docker run -d \
        -p 5000:5000 \
        -p 5001:5001 \
        -e ES_URL=$ES_URL \
        -e INFLUXDB_HOST=$INFLUXDB_HOST \
        -e INFLUXDB_PORT=$INFLUXDB_PORT \
        -e SLACK_WEBHOOK=$SLACK_WEBHOOK \
        -e SLACK_USERNAME=$SLACK_USERNAME \
        -e SLACK_ICON=$SLACK_ICON \
        -e VAULT_URL=$VAULT_URL \
        -e VAULT_TOKEN=$VAULT_TOKEN  \
        --name sitch_logstash \
        sitch/logstash

### Running with verbose output

        docker run -d \
        -p 5000:5000 \
        -p 5001:5001 \
        -e ES_URL=$ES_URL \
        -e INFLUXDB_HOST=$INFLUXDB_HOST \
        -e INFLUXDB_PORT=$INFLUXDB_PORT \
        -e SLACK_WEBHOOK=$SLACK_WEBHOOK \
        -e SLACK_USERNAME=$SLACK_USERNAME \
        -e SLACK_ICON=$SLACK_ICON \
        -e VAULT_URL=$VAULT_URL \
        -e VAULT_TOKEN=$VAULT_TOKEN  \
        --name sitch_logstash \
        sitch/logstash \
        debug
