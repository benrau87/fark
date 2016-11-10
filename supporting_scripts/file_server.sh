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
touch start_server.sh
chmod +x start_server.sh
echo " #!/bin/bash
       python -m SimpleHTTPServer 8181" > start_server.sh

echo
echo "What is the IP or Hostname of the machine running the ELK Stack?"
read IP
echo "Downloading beats shippers"

git clone https://github.com/benrau87/beats.git
cd beats/
perl -pi -e s/localhost/$IP/g packetbeat/Nix_packetbeat.yml
perl -pi -e s/localhost/$IP/g topbeat/topbeat.yml
perl -pi -e s/localhost/$IP/g filebeat/Nix_filebeat.yml

wget https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.0.0-amd64.deb
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.0-amd64.deb
wget https://download.elastic.co/beats/topbeat/topbeat_1.3.1_amd64.deb
wget https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-5.0.0-windows-x86_64.zip

cp -rf ~/Desktop/clientinstall.$HOSTNAME/GRR_installers $PWD

echo 
echo "Starting simple file server"
echo 
python -m SimpleHTTPServer 8181
