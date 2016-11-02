#!/bin/bash

echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
service kibana stop
service logstash stop
service elasticsearch stop
apt-get update && apt-get install kibana elasticsearch logstash -y
