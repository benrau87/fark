#!/bin/bash


###Installs packetbeat shipper on Linux_64-bit

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi
wget https://download.elastic.co/beats/topbeat/topbeat_1.3.1_amd64.deb
dpkg -i topbeat_*

rm /etc/topbeat/*.yml
git clone https://github.com/benrau87/beats.git
cd beats/topbeat/

cp topbeat.yml /etc/topbeat/topbeat.yml
update-rc.d topbeat defaults 95 10
systemctl enable topbeat.service
service topbeat restart
