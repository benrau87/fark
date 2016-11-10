#!/bin/bash

###Starts a simple http server under the client install directory to serve up installation packages
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

cd ~/Desktop
mkdir $HOSTNAME.fileserver
cd $HOSTNAME.fileserver
cp ~/Desktop/clientinstall.$HOSTNAME/logstash-forwarder.crt ~/Desktop/$HOSTNAME.fileserver/
echo
echo "What is the IP or Hostname of the machine running the ELK Stack?"
read host
echo "Downloading beats shippers"

git clone https://github.com/benrau87/beats.git
wget https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.0.0-amd64.deb
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.0-amd64.deb
wget https://download.elastic.co/beats/topbeat/topbeat_1.3.1_amd64.deb
wget https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-5.0.0-windows-x86_64.zip

echo 
echo "Starting simple file server"
echo 
python -m SimpleHTTPServer 8181
echo
echo "Navigate to this machine on the above port to access client installs"
echo "Closing this window will stop the file server"
