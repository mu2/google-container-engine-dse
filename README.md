# google-container-engine-dse
Google Deployment Manager scripts for deploying DataStax Enterprise (DSE) on Google Container Engine (GKE)

These don't work yet.  Sorry.

## Getting started

Deploying to GKE is a two step process.

### Deploy a cluster

Using `cluster.yaml`, deploy a GKE cluster to use for deploying the solution
later. Fill in the following information before deploying:

* desired cluster name
* basicauth username and password for authenticating access to the cluster

When ready, deploy with the following command:

    gcloud deployment-manager deployments create cluster --config cluster.yaml

This will result in two resources:

* a GKE cluster with the name specified in `cluster.yaml`
* a Deployment Manager type named `<deployment-name>-<cluster-name>-type`

### Deploying DSE

Using `cassandra.yaml`, deploy to the GKE cluster created in the last step.
Fill in the following information before deploying:

* the cluster type created for the GKE cluster deployed previously
* the number of nodes in the cluster (if changed from the default 4 nodes)

When ready, deploy with the following command:

    gcloud deployment-manager deployments create cassandra --config cassandra.yaml

