#!/bin/bash

###Remove any ony config files to avoid numbering mixups
rm /etc/logstash/conf.d/*

cp ~/forensic-grr-elk/logstash_config/* /etc/logstash/conf.d/

