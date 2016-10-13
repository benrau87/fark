#!/bin/bash

###Script to install Timesketch
echo
echo "Installing PostgreSQL"
apt-get -qq install postgresql python-psycopg2 -y

echo "local   all             timesketch                              md5" | tee -a /etc/postgresql/9.3/main/pg_hba.conf
service postgresql restart

echo "Installing PIP"
apt-get -qq python-pip python-dev libffi-dev -y

pip install timesketch

