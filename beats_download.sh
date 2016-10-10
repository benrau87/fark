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
wget https://download.elastic.co/beats/filebeat/filebeat-1.3.1-darwin.tgz
wget https://download.elastic.co/beats/filebeat/filebeat-1.3.1-windows.zip

cd $HOME/Desktop/clientinstall*
mkdir winlogbeat
cd winlogbeat/

wget https://download.elastic.co/beats/winlogbeat/winlogbeat-1.3.1-windows.zip

cd $HOME/Desktop/clientinstall*
mkdir topbeat
cd topbeat/

wget https://download.elastic.co/beats/topbeat/topbeat_1.3.1_i386.deb
wget https://download.elastic.co/beats/topbeat/topbeat-1.3.1-i686.rpm
wget https://download.elastic.co/beats/topbeat/topbeat-1.3.1-i686.tar.gz
wget https://download.elastic.co/beats/topbeat/topbeat-1.3.1-darwin.tgz
wget https://download.elastic.co/beats/topbeat/topbeat_1.3.1_amd64.deb
wget https://download.elastic.co/beats/topbeat/topbeat-1.3.1-x86_64.rpm
wget https://download.elastic.co/beats/topbeat/topbeat-1.3.1-x86_64.tar.gz
wget https://download.elastic.co/beats/topbeat/topbeat-1.3.1-windows.zip

cd $HOME/Desktop/clientinstall*
mkdir metricbeat
cd metricbeat/

wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-i386.deb
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-amd64.deb
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-x86_64.rpm
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-i686.rpm
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-linux-x86_64.tar.gz
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-linux-x86.tar.gz
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-darwin-x86_64.tar.gz
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-windows-x86_64.zip
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-rc1-windows-x86.zip

