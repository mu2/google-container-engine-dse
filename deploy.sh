#!/usr/bin/env bash

# You typically would start with deploying a cluster on GKE
gcloud container clusters create <cluster-name>

# Once your GKE clusters are up, you would need to provide the cluster information in cluster.yaml. This can be typically found by
kubectl config view
kubectl view cluster-info

# Once you have the cluster,yaml configured with name, IP and password, you can deploy cluster-type using
gcloud deployment-manager deployments create cluster-types --config cluster.yaml

# This should bring up the GKE deployment that you should be able to see in Deployment-Manager tab

# Now from the context, cassandra.yaml and datastax.yaml would require some configuration from uour end to deploy the solutions. These would go in jinja file(s)

# To deploy these solutions on the existing cluster, you would use
gcloud deployment-manager deployments create <datastax | cassandra> --config <datastax | cassandra>.yaml
