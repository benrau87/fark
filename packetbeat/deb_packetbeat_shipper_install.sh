#!/bin/bash

###Installs packetbeat shipper on Linux_64-bit

wget https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.0.0-amd64.deb

dpkg -i packetbeat-*

rm /etc/packetbeat/packetbeat.yml

cp ~/forensic-grr-elk/packetbeat/Nix_packetbeat.yml /etc/packetbeat/packetbeat.yml

service packetbeat restart


