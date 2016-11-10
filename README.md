# FARK
Welcome to the Forensic and Active Response Kit
Repo for work on setting up a centralized server for incident response.
git clone to ~ and chmod +x setup.sh

Follow the on-screen setup questions

Comprised of GRR and ELK stack with packetbeat clients.
GRR installs with clients that are configured based of the server hostname that the script is ran on.
ELK installs with basic dashboards and Packetbeat YMLs and shipping certs are made during the install, but the YMLs will need to be modified to include the server hostname and any production ports that you may want to monitor.

Extra tools are scripted to install as well, if needed. Forensic tools are in the "Tools" folder on your desktop and
counter-hacking tools are under the /opt/ directory.

The supporting_scripts folder in this git contain most of the scripts needed for the install, but there are others in there 
that can aide you in resetting your ELK stack + indexed data, start a file server to allow easy access to download clients 
and a script to add in custom dashboards to kibana.

Works on Ubuntu Server 16.01
Tested with MATE desktop and latest version of Firefox

