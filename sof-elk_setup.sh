#!/bin/bash
rm /etc/logstash/conf.d/*

cp ~/forensic-grr-elk/logstash_config/* /etc/logstash/conf.d/
