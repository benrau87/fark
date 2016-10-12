#!/bin/bash
rm /etc/logstash/conf.d/*

cp ~/forensic-grr-elk/logstash_config/* /etc/logstash/conf.d/

mkdir ~/forensic-grr-elk/dashboards
mkdir ~/forensic-grr-elk/dashboards/dashboard
mkdir ~/forensic-grr-elk/dashboards/search
mkdir ~/forensic-grr-elk/dashboards/visualization
mkdir ~/forensic-grr-elk/dashboards/index-pattern

