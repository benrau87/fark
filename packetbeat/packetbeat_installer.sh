#!/bin/bash

###Installs packetbeat shipper on Linux_64-bit

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi
wget https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.0.0-amd64.deb
apt-get -qq install libpcap -y
dpkg -i packetbeat-*

rm /etc/packetbeat/*.yml
git clone https://github.com/benrau87/beats.git
cd beats/packetbeat/

cp Nix_packetbeat.yml /etc/packetbeat/packetbeat.yml

service packetbeat restart


