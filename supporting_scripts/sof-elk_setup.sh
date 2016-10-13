#!/bin/bash

rm /etc/logstash/conf.d/*

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

cp -r ~/forensic-grr-elk/dashboards/* /usr/local/sof-elk/
cp -r ~/forensic-grr-elk/sof_dashboards/* /usr/local/sof-elk/sof_dashboards/
cp ~/forensic-grr-elk/grok-patterns/* /usr/local/sof-elk/grok-patterns/
cp ~/forensic-grr-elk/lib/custom/* /usr/local/sof-elk/lib/
cp ~/forensic-grr-elk/logstash_conf/* /etc/logstash/conf.d/
