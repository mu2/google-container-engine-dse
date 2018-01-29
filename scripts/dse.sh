#!/usr/bin/env bash

echo "installing a bunch of prerequisites"
apt-get -y install dnsutils # install dig
apt-get -y install sudo
apt-get -y install adduser curl lsb-base procps zlib1g gzip sysstat ntp bash tree
apt-get -y install python python-support
apt-get -y install apt-transport-https
apt-get -y install unzip
echo "done with prerequisites"

release="6.0.4"
wget https://github.com/DSPN/install-datastax-ubuntu/archive/$release.zip
unzip $release.zip
cd install-datastax-ubuntu-$release/bin

cloud_type="gke"
seed_nodes_dns_names=$SEED_NODE_SERVICE
data_center_name="dc0"
opscenter_dns_name=$OPSCENTER_NAME

echo "Configuring nodes with the settings:"
echo cloud_type $cloud_type
echo seed_nodes_dns_names $seed_nodes_dns_names
echo data_center_name $data_center_name
echo opscenter_dns_name $opscenter_dns_name

./dse.sh $cloud_type $seed_nodes_dns_names $data_center_name $opscenter_dns_name

# Run indefinitely
tail -f /dev/null
