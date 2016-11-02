#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list
service kibana stop
service logstash stop
service elasticsearch stop
apt-get update && apt-get install kibana elasticsearch logstash -y

echo
echo "Restarting ELK stack...Please wait"
echo
#Use to restart the ELK stack services if needed
service elasticsearch restart
service logstash restart
service kibana restart
service nginx restart
