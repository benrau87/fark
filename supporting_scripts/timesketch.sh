#!/bin/bash

###Script to install Timesketch
echo
echo "Installing PostgreSQL"
apt-get -qq install postgresql python-psycopg2 -y
apt-get -qq install openjdk-7-jre-headless -y

echo "local   all             timesketch                              md5" | tee -a /etc/postgresql/9.*/main/pg_hba.conf
service postgresql restart

echo "Installing PIP"
apt-get -qq install python-pip python-dev libffi-dev -y

pip install timesketch

touch /etc/timesketch.conf
chmod 600 /etc/timesketch.conf

openssl rand -base64 32 

echo
echo "What would you like your SQL username to be?"
read name

-u postgres createuser -d -P -R -S $name

echo
echo "Please retype the same password you just created"
read pass
echo
echo "SQLALCHEMY_DATABASE_URI = u'postgresql://$name:$pass@localhost/timesketch'" | tee -a /etc/timesketch.conf

tsctl add_user -u $name

tsctl runserver -h 0.0.0.0 -p 5000
