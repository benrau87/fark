#!/bin/bash

mkdir /usr/local/logstash-syslog
mkdir /usr/local/logstash-passivedns
mkdir /usr/local/logstash-netflow
mkdir /usr/local/logstash-httpd
mkdir /var/db
mkdir /var/db/logstash
mkdir /var/db/logstash/sincedb
mkdir /usr/local/sof-elk
mkdir /usr/local/sof-elk/lib
mkdir /usr/local/sof-elk/grok-patterns
mkdir /usr/local/sof-elk/sof_dashboards

cp -r ~/fark/dashboards/* /usr/local/sof-elk/
cp -r ~/fark/sof_dashboards/* /usr/local/sof-elk/sof_dashboards/
cp ~/fark/grok-patterns/* /usr/local/sof-elk/grok-patterns/
cp ~/fark/lib/custom/* /usr/local/sof-elk/lib/

bash /usr/share/elasticsearch/bin/plugin install ingest-geopip
