# Logstash container for SITCH
## Making things just a little bit easier.

Needs these env vars:

| var            | purpose                       |
|----------------|-------------------------------|
| ES_HOSTNAME    | Elasticsearch hostname  or IP |
| GRAPHITE_HOST  | Graphite hostname or IP       |
| GRAPHITE_PORT  | Graphite port                 |
| SLACK_WEBHOOK  | Webhook for posting to Slack  |
| SLACK_USERNAME | Username for Slack messages   |
| SLACK_ICON     | Icon for Slack messages       |
| VAULT_URL      | URL for accessing vault       |
| VAULT_TOKEN    | Token for accessing vault     |

Build and fire it up daemonized, and you should be off and running.  Check the
logs for your container a few minutes after you start it to make sure your
settings are sane.  Logstash is pretty good about making eloquent complaints
when it's unhappy.
