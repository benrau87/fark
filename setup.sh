#!/bin/bash
###Run as root, installs GRR
###
#Clients will install with pointers to the server hostname
#If you have not setup a DNS A-record for this machine, you will #need to before the clients can contact the server.


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

echo "Installing dependencies"
echo
echo

add-apt-repository -y ppa:webupd8team/java

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch |  apt-key add -

echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana-4.4.x.list


echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | sudo tee -a /etc/apt/sources.list.d/logstash-2.2.x.list

sleep 5

apt-get update 

sleep 5

####GRR Install

echo "Installing GRR"
echo


wget https://raw.githubusercontent.com/google/grr/master/scripts/install_script_ubuntu.sh

sleep 2

sudo bash install_script_ubuntu.sh

###Copy exe's to Desktop
echo
echo
echo "Creating directory for GRR installers"
echo 
echo

mkdir /$HOME/Desktop/clientinstall.$HOSTNAME
cp -r /usr/share/grr-server/executables/installers /$HOME/Desktop/clientinstall.$HOSTNAME/

sleep 2

###Install ELK Stack

apt-get -y install oracle-java8-installer elasticsearch kibana nginx apache2-utils logstash

###Elastisearch

service elasticsearch start

update-rc.d elasticsearch defaults 95 10

sleep 2

###Kiabana

echo "server.host: 127.0.0.1" | tee -a /opt/kibana/config/kibana.yml 

update-rc.d kibana defaults 96 9

service kibana start

sleep 2

echo ------------------------------------------------
echo ------------------------------------------------
echo What would you like your Kibana username to be?
read kibanauser
htpasswd -c /etc/nginx/htpasswd.users $kibanauser
 
#####Creates site default file
mv /etc/nginx/sites-available/default /etc/nginx/


cp /$PWD/default /etc/nginx/sites-available/

service nginx restart

sleep 2

###Create Certs
mkdir -p /etc/pki/tls/certs
mkdir /etc/pki/tls/private

cd /etc/pki/tls; sudo openssl req -subj '/CN=$HOSTNAME/' -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout private/logstash-forwarder.key -out certs/logstash-forwarder.crt

###Setup Beats for Logstash input to Elastisearch output

cp /$HOME/Desktop/GRR_ELK_Setup/02-beats-input.conf /etc/logstash/conf.d/


cp /$HOME/Desktop/GRR_ELK_Setup/30-elasticsearch-output.conf /etc/logstash/conf.d/

###Install netflow dashboards for Kibana
cd ~
curl -L -O https://download.elastic.co/beats/dashboards/beats-dashboards-1.1.0.zip

apt-get -y install unzip

sleep 2

unzip beats-dashboards-*.zip

cd beats-dashboards-*
./load.sh

###Configure packetbeat clients
 cp /etc/pki/tls/certs/logstash-forwarder.crt /$HOME/Desktop/GRR_ELK_Setup/packetbeat/

cp -r /$HOME/Desktop/GRR_ELK_Setup/packetbeat /$HOME/Desktop/clientinstall.$HOSTNAME/


##################################Test
###Forensic tools install
installtools(){

  if ask "Do you want to install forensic tools?" Y; then

  echo Installing Forensic Tools

  apt-get -y -qq install ctags curl git vim vim-doc vim-scripts \
    exfat-fuse exfat-utils zip python-virtualenv tshark
    
  mkdir ~/Desktop/Cases && ~/Desktop/Tools

 
# Add scripts from different sources
# http://phishme.com/powerpoint-and-custom-actions/
  wget -q -O ~/Desktop/Tools/psparser.py \
    https://github.com/phishme/malware_analysis/blob/master/scripts/psparser.py && \
    chmod +x ~/Desktop/Tools/psparser.py 
 echo "Installed psparser.py"
 
# https://www.virustotal.com/en/documentation/public-api/#getting-file-scans
  wget -q -O ~/Desktop/Tools/vt.py \
    https://raw.githubusercontent.com/Xen0ph0n/VirusTotal_API_Tool/master/vt.py && \
    chmod +x ~/Desktop/Tools/vt.py 
 echo "Installed vt.py"
 
# https://testssl.sh/
  wget -q -O ~/Desktop/Tools/testssl.sh \
    https://testssl.sh/testssl.sh && \
    chmod +x ~/Desktop/Tools/testssl.sh 
  echo "Installed testssl.sh."

  cd  ~/Desktop/Tools/

# Add git repos
# http://www.tekdefense.com/automater/
  git clone --quiet https://github.com/1aN0rmus/TekDefense-Automater.git 
  echo "Checked out Automater."

# https://n0where.net/malware-analysis-damm/
  git clone --quiet https://github.com/504ensicsLabs/DAMM 

# https://github.com/keydet89/RegRipper2.8
  git clone --quiet https://github.com/keydet89/RegRipper2.8.git
  echo "Checked out RegRipper2.8." 

# https://github.com/DidierStevens/DidierStevensSuite
  git clone --quiet https://github.com/DidierStevens/DidierStevensSuite.git 
  echo "Checked out DidierStevensSuite." 

# https://github.com/Yara-Rules/rules.git
  git clone --quiet https://github.com/Yara-Rules/rules.git ~/src/git/rules 
  echo "Checked out Yara-Rules."

# https://github.com/decalage2/oletools.git
  git clone --quiet https://github.com/decalage2/oletools.git ~/src/git/oletools 
  echo "Checked out oletools."
  fi
}
####################################End test
echo
echo
echo "Your GRR-ELK stack has been installed, client installations are located on your desktop in a folder called clientinstall.$HOSTNAME"
echo
echo "Your GRR dashboard is located at $HOSTNAME:8000 and your Kibana dashboard is at $HOSTNAME:80"
echo
echo "If you need to configure packetbeat, you will need to modify the yml file by replacing the server:5044 with the logstash server host/ip. You will also need to install the included .crt for the client to use."
