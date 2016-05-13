#!/usr/bin/env bash

gcloud container clusters get-credentials cluster-clustername
kubectl get pods

# Need this information:
# datastax-node-0-n1yqu 10.160.0.3
# datastax-node-1-l4dqs
# datastax-node-2-jc7dm
# datastax-node-3-fyrrp

# interestingly the load balancer seems to be working for OpsCenter.  Maybe it only needs 9042?

# seed line is currently:
#          - seeds: "10.163.241.102"

# this sed isn't working for some reason.  It works when run from an interactive session
kubectl exec datastax-node-0-n1yqu sed -i 's/10.163.241.102/10.160.0.3/' /etc/dse/cassandra/cassandra.yaml

kubectl exec datastax-node-0-n1yqu cat /etc/dse/cassandra/cassandra.yaml | grep seeds:
kubectl exec datastax-node-0-n1yqu service dse restart
kubectl exec datastax-node-0-n1yqu nodetool status
