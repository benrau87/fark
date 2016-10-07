#!/bin/bash
###Use this script to download Beats shippers if needed. Then you can copy over the configured ymls that were created during installation.

dir=~/Desktop/clientinstall.$HOSTNAME

mkdir $dir/packetbeat

cd $dir/packetbeat/

wget https://download.elastic.co/beats/packetbeat/packetbeat_1.3.1_i386.deb


wget https://download.elastic.co/beats/packetbeat/packetbeat_1.3.1_amd64.deb


wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-i686.rpm


wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-x86_64.rpm


wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-i686.tar.gz


wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-x86_64.tar.gz


wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-darwin.tgz


wget https://download.elastic.co/beats/packetbeat/packetbeat-1.3.1-windows.zip
