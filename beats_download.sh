#!/bin/bash
###Use this script to download Beats shippers if needed. Then you can copy over the configured ymls that were created during installation.
cd $HOME/Desktop/clientinstall*
cd packetbeat/
mkdir shippers
cd shippers/

wget https://download.elastic.co/beats/packetbeat/packetbeat_1.3.1_i386.deb
wget https://download.elastic.co/beats/packetbeat/packetbeat_1.3.1_amd64.deb
wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-i686.rpm
wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-x86_64.rpm
wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-i686.tar.gz
wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-x86_64.tar.gz
wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-darwin.tgz
wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-windows.zip

cd $HOME/Desktop/clientinstall*
mkdir filebeat
cd filebeat/

wget https://download.elastic.co/beats/filebeat/filebeat_1.3.1_i386.deb
wget https://download.elastic.co/beats/filebeat/filebeat_1.3.1_amd64.deb
wget https://download.elastic.co/beats/filebeat/filebeat-1.3.1-i686.rpm
wget https://download.elastic.co/beats/filebeat/filebeat-1.3.1-x86_64.rpm
wget https://download.elastic.co/beats/filebeat/filebeat-1.3.1-i686.tar.gz
wget https://download.elastic.co/beats/filebeat/filebeat-1.3.1-x86_64.tar.gz
wget https://download.


.co/beats/filebeat/filebeat-1.3.1-darwin.tgz



wget https://download.elastic.co/beats/filebeat/filebeat-1.3.1-windows.zip

cd $HOME/Desktop/clientinstall*
mkdir winlogbeat
cd winlogbeat/

cd $HOME/Desktop/clientinstall*
mkdir topbeat
cd topbeat/

cd $HOME/Desktop/clientinstall*
mkdir metricbeat
cd metricbeat/
https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-i386.deb
https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-i686.rpm
https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-linux-x86.tar.gz
https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-darwin-x86_64.tar.gz
https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-windows-x86_64.zip
https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-windows-x86.zip
