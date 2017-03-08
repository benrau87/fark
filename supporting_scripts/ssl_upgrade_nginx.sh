#!/bin/bash

#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
gitdir=$PWD

##Logging setup
logfile=/var/log/nginx_install.log
mkfifo ${logfile}.pipe
tee < ${logfile}.pipe $logfile &
exec &> ${logfile}.pipe
rm ${logfile}.pipe

##Functions
function print_status ()
{
    echo -e "\x1B[01;34m[*]\x1B[0m $1"
}

function print_good ()
{
    echo -e "\x1B[01;32m[*]\x1B[0m $1"
}

function print_error ()
{
    echo -e "\x1B[01;31m[*]\x1B[0m $1"
}

function print_notification ()
{
	echo -e "\x1B[01;33m[*]\x1B[0m $1"
}

function error_check
{

if [ $? -eq 0 ]; then
	print_good "$1 successfully."
else
	print_error "$1 failed. Please check $logfile for more details."
exit 1
fi

}

function install_packages()
{

apt-get update &>> $logfile && apt-get install -y --allow-unauthenticated ${@} &>> $logfile
error_check 'Package installation completed'

}

function dir_check()
{

if [ ! -d $1 ]; then
	print_notification "$1 does not exist. Creating.."
	mkdir -p $1
else
	print_notification "$1 already exists. (No problem, We'll use it anyhow)"
fi

}

########################################
##BEGIN MAIN SCRIPT##
#Pre checks: These are a couple of basic sanity checks the script does before proceeding.
echo -e "${YELLOW}What is the IP address of the machine that is hosting this Kibana webpage?${NC}"
read ipaddr
echo

##Install nginx
print_status "${YELLOW}Waiting for dpkg process to free up...${NC}"
print_status "${YELLOW}If this takes too long try running ${RED}sudo rm -f /var/lib/dpkg/lock${YELLOW} in another terminal window.${NC}"
while fuser /var/lib/dpkg/lock >/dev/null 2>&1; do
   sleep 1
done
print_status "${YELLOW}Installing Nginx...${NC}"
apt-get -qq install nginx apache2-utils -y &>> $logfile
error_check 'Nginx installed'

##Create and secure keys
mkdir /etc/nginx/ssl &>> $logfile
cd /etc/nginx/ssl &>> $logfile
print_status "${YELLOW}Configuring and installing SSL keys...go get a sandwich${NC}"
openssl req -subj '/CN=Kibana/'-x509 -nodes -days 3650 -newkey rsa:4096 -keyout kibana.key -out kibana.crt &>> $logfile
openssl dhparam -out dhparam.pem 4096 &>> $logfile
error_check 'SSL configured'
cd ..
chown -R root:www-data /etc/nginx/ssl &>> $logfile
chmod -R u=rX,g=rX,o= /etc/nginx/ssl &>> $logfile

##Remove default sites and create new cuckoo site
rm /etc/nginx/sites-enabled/default &>> $logfile
print_status "${YELLOW}Configuring Nginx webserver...${NC}"

tee -a /tmp/kibana <<EOF
  server {
  
        listen 443 ssl;
        server_name $HOSTNAME;
        ssl_certificate /etc/nginx/ssl/kibana.crt;
        ssl_certificate_key /etc/nginx/ssl/kibana.key;
        auth_basic "Restricted Access";
        auth_basic_user_file /etc/nginx/htpasswd.users;

        location / {
            proxy_pass http://localhost:5601;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;        
        }
    
EOF

error_check 'Site configured'
mv /tmp/kibana /etc/nginx/sites-available/
mv /etc/nginx/sites-available/kibana /etc/nginx/sites-available/default

##Create and restart service
service nginx restart
