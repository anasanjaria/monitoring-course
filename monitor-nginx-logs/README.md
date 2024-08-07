# Monitor Nginx logs using filebeat

Are you using Nginx? Are you monitoring your Nginx logs?

At work, we used Nginx logs as metrics to monitor the availability of our system. However, it is not limited to merely availability but even more.

I will show you how to monitor Nginx logs, use them as metrics and make the most out of them.

Medium: https://medium.com/@anasanjaria/increase-stability-of-your-web-application-by-monitoring-nginx-logs-c304604b1213

## How to use?
1. Start the beat stack & nginx
```
docker-compose up -d nginx filebeat
```
2. Once the cluster is up & running execute the following command.
```
docker-compose up curl-request-client
```