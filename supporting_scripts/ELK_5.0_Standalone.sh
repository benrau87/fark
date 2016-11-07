#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

echo "Adding Repos"
echo
echo

add-apt-repository -y ppa:webupd8team/java
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list

#Wait for dpkg process to finish
echo "Waiting for dpkg process to free up..."
while fuser /var/lib/dpkg/lock >/dev/null 2>&1; do
   sleep 1
done
echo
echo "Updating APT and installing dependencies"

apt-get -qq update
apt-get -qq dist-upgrade -y
apt-get -qq install ctags curl git vim vim-doc vim-scripts exfat-fuse exfat-utils zip python-virtualenv jq tshark -y
apt-get -qq install oracle-java8-installer -y
apt-get -qq install elasticsearch kibana nginx apache2-utils logstash -y

#Wait for dpkg process to finish
echo "Waiting for dpkg process to free up..."
while fuser /var/lib/dpkg/lock >/dev/null 2>&1; do
   sleep 1
done
####ELK Install###################################################################################################
##################################################################################################################
echo "Configuring ELK Stack"
echo

###Elastisearch
echo "Configuring Elasticsearch"
update-rc.d elasticsearch defaults 95 10
systemctl enable elasticsearch.service
service elasticsearch start
sleep 2

###Logstash
echo "Configuring Logstash"
update-rc.d logstash 95 10
systemctl enable logstash.service
service logstash start
sleep 2

###Kiabana
echo "Configuring Kibana"
echo "server.host: 127.0.0.1" | tee -a /opt/kibana/config/kibana.yml 
update-rc.d kibana defaults 95 10
systemctl enable kibana.service
service kibana start
sleep 2
echo ------------------------------------------------
echo ------------------------------------------------
echo What would you like your Kibana username to be?
read kibanauser
htpasswd -c /etc/nginx/htpasswd.users $kibanauser
 
#####Creates site default file
mv /etc/nginx/sites-available/default /etc/nginx/
cd ..
cd lib/
cp default /etc/nginx/sites-available/
service nginx restart
cp kibana.desktop ~/Desktop/
sleep 2


