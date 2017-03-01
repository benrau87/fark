#!/bin/bash

###Debian 64-bit
###Installs packetbeat shipper on Linux_64-bit

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi
echo "What is the IP or Hostname of your Logstash server?"
read IP

wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.0-amd64.deb
dpkg -i filebeat-*

rm /etc/filebeat/*.yml
git clone https://github.com/benrau87/beats.git
cd beats/filebeat/

cp Nix_filebeat.yml /etc/filebeat/filebeat.yml
update-rc.d filebeat defaults 95 10
systemctl enable filebeat.service

perl -pi -e s/localhost/$IP/g /etc/filebeat/filebeat.yml

cd ..
mkdir /usr/local/share/ca-certificates/logstash
chmod 755 /usr/local/share/ca-certificates/logstash
mv logstash-*.crt /usr/local/share/ca-certificates/logstash/

update-ca-certificates
service filebeat restart
