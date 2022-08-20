# Monitor MySQL aborted connection

It shows how to monitor mysql aborted connection using metricbeat mysql module [1].

As per official guideline of MySQL [2]

`Aborted_connects` -> The number of failed attempts to connect to the MySQL server.

Possible reasons could be
- Invalid credentials
- Disk space is full

Medium: https://levelup.gitconnected.com/monitor-aborted-mysql-connections-using-metricbeat-4f184f6a3dbf

## Troubleshooting
You need to set virtual memory for elasticsearch container [3].

```
sysctl -w vm.max_map_count=262144
```

## Resources
[1] https://www.elastic.co/guide/en/beats/metricbeat/7.17/metricbeat-module-mysql.html

[2] https://dev.mysql.com/doc/refman/8.0/en/server-status-variables.html#statvar_Aborted_connects

[3] https://www.elastic.co/guide/en/elasticsearch/reference/7.17/vm-max-map-count.html