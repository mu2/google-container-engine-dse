#!/usr/bin/env bash

wget https://github.com/DSPN/install-datastax/archive/master.zip
apt-get -y install unzip
unzip master.zip
cd install-datastax-master/bin

cloud_type="google"
zone=$(curl -s -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/zone" | grep -o [[:alnum:]-]*$)
data_center_name=$zone;
seed_nodes_dns_names=$SEED_NODE_SERVICE;

echo "Configuring nodes with the settings:";
echo cloud_type $cloud_type;
echo seed_nodes_dns_names $seed_nodes_dns_names;
echo data_center_name $data_center_name;

apt-get install curl
apt-get install sudo
./dse.sh $cloud_type $seed_nodes_dns_names $data_center_name;

sleep 3600
