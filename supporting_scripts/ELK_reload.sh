#!/bin/bash


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

echo
echo "Restarting ELK stack...Please wait"
echo
#Use to restart the ELK stack services if needed
service elasticsearch restart
service logstash restart
service kibana restart
service nginx restart
