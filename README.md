# forensic-grr-elk
Repo for work on setting up a centralized server for incident response.

Comprised of GRR and ELK stack with packetbeat clients.
GRR installs with clients that are configured based of the server hostname that the script is ran on.
ELK installs with basic dashboards and Packetbeat YMLs and shipping certs are made during the install, but the YMLs will need to be modified to include the server hostname and any production ports that you may want to monitor.

Works on Ubuntu Server 16.01
Tested with MATE desktop and latest version of Firefox

