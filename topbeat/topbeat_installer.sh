#!/bin/bash


###Installs packetbeat shipper on Linux_64-bit

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi
echo "What is the IP or Hostname of your Logstash server?"
read IP

wget https://download.elastic.co/beats/topbeat/topbeat_1.3.1_amd64.deb
dpkg -i topbeat_*

rm /etc/topbeat/*.yml
git clone https://github.com/benrau87/beats.git
cd beats/topbeat/

cp topbeat.yml /etc/topbeat/topbeat.yml
update-rc.d topbeat defaults 95 10
systemctl enable topbeat.service

perl -pi -e s/localhost/$IP/g /etc/topbeat/topbeat.yml
cd ..
mkdir /usr/local/share/ca-certificates/logstash
chmod 755 /usr/local/share/ca-certificates/logstash
mv logstash-*.crt /usr/local/share/ca-certificates/logstash/

update-ca-certificates
service topbeat restart
