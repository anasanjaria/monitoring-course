#!/bin/bash
# This script collects metrics via postgres query defined in a variable "query".

# replace it with your desired query for monitoring
query="SELECT count(*) AS active_connections FROM pg_stat_activity"
# name of the container
name="postgres-metric-collector"
# DB host
host="postgres"

# Recommendations:
# - Please don't use root user for collecting metrics.
# - Only use read-only and dedicated user for collecting metrics.
/usr/bin/docker run --name "$name" --rm --memory="64m" \
  --network demo \
  -e PGPASSWORD=password \
  postgres:14.5-alpine \
  psql -h "$host" -U postgres -d demo -c "\copy (SELECT row_to_json(t) FROM ( $query ) t) To STDOUT" >> metrics/query-output.log
