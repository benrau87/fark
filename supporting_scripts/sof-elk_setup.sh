#!/bin/bash

###Remove any ony config files to avoid numbering mixups
rm /etc/logstash/conf.d/*

mkdir usr/local/logstash-syslog/
mkdir usr/local/logstash-passivedns/
mkdir usr/local/logstash-netflow/
mkdir usr/local/logstash-httpd/
mkdir var/db/logstash/sincedb/
mkdir usr/local/sof-elk/lib/
mkdir /usr/local/sof-elk/grok-patterns/

cp ~/forensic-grr-elk/grok-patterns/* /usr/local/sof-elk/grok-patterns/
cp ~/forensic-grr-elk/lib/* usr/local/sof-elk/lib/
cp ~/forensic-grr-elk/logstash_conf/* /etc/logstash/conf.d/
