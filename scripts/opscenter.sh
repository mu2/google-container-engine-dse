#!/usr/bin/env bash

echo "installing a bunch of prerequisites"
apt-get -y install dnsutils # install dig
apt-get -y install curl
apt-get -y install sudo
apt-get -y install unzip
echo "done with prerequisites"

wget https://github.com/DSPN/install-datastax/archive/5.0.1-1.zip
unzip 5.0.1-1.zip
cd install-datastax-5.0.1-1/bin

cloud_type="gke"
seed_nodes_dns_names=$SEED_NODE_SERVICE

echo "Configuring OpsCenter with the settings:"
echo cloud_type $cloud_type
echo seed_nodes_dns_names $seed_nodes_dns_names

./opscenter.sh $cloud_type $seed_nodes_dns_names

# 100 hours
sleep 360000
