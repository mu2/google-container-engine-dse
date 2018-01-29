#!/usr/bin/env bash

echo "installing a bunch of prerequisites"
apt-get -y install dnsutils # install dig
apt-get -y install curl
apt-get -y install sudo
apt-get -y install unzip
echo "done with prerequisites"

release="6.0.4"
wget https://github.com/DSPN/install-datastax-ubuntu/archive/$release.zip
unzip $release.zip
cd install-datastax-ubuntu-$release/bin

cloud_type="gke"
seed_nodes_dns_names=$SEED_NODE_SERVICE

echo "Configuring OpsCenter with the settings:"
echo cloud_type $cloud_type
echo seed_nodes_dns_names $seed_nodes_dns_names

./opscenter.sh $cloud_type $seed_nodes_dns_names

# Run indefinitely
tail -f /dev/null
