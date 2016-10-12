#!/bin/bash
rm /etc/logstash/conf.d/*

cp ~/forensic-grr-elk/sof-elk/configfiles/* /etc/logstash/conf.d/
