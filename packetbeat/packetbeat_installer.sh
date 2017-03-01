#!/bin/bash

###Installs packetbeat shipper on Linux_64-bit

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi
echo "What is the IP or Hostname of your Logstash server?"
read IP

wget https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.0.0-amd64.deb
apt-get -qq install libpcap0.8 -y
dpkg -i packetbeat-*

rm /etc/packetbeat/*.yml
git clone https://github.com/benrau87/beats.git
cd beats/packetbeat/

cp Nix_packetbeat.yml /etc/packetbeat/packetbeat.yml
update-rc.d packetbeat defaults 95 10
systemctl enable packetbeat.service

perl -pi -e s/localhost/$IP/g /etc/packetbeat/packetbeat.yml

cd ..
mkdir /usr/share/ca-certificates/logstash
chmod 755 /usr/share/ca-certificates/logstash
mv logstash-forwarder.crt /usr/share/ca-certificates/logstash/

update-ca-certificates

service packetbeat restart


