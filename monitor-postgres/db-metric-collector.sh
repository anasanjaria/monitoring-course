#!/bin/bash

# replace it with your desired query for monitoring
query="SELECT
       relname AS TableName,
       n_live_tup AS LiveTuples,
       n_dead_tup AS DeadTuples
       FROM pg_stat_user_tables"
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
