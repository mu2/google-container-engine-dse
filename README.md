# google-container-engine-dse
Google Deployment Manager scripts for deploying DataStax Enterprise (DSE) on Google Container Engine (GKE)

These don't work yet.  Sorry.  Something isn't right with the network.  Otherwise it all seems there.

## Getting Started

The [deploy.sh](deploy.sh) script wraps both the deploy cluster and deploy DataStax commands.  To create a cluster simply run:

    ./deploy.sh

### Inside deploy.sh -- Deploy a Cluster

Consider modifying the following information in `cluster.yaml` before deploying:

* desired cluster name
* basicauth username and password for authenticating access to the cluster

deploy.sh runs the command:

    gcloud deployment-manager deployments create cluster --config cluster.yaml

This will result in two resources:

* a GKE cluster with the name specified in `cluster.yaml`
* a Deployment Manager type named `<deployment-name>-<cluster-name>-type`

### Inside deploy.sh -- Deploying DataStax

Consider modifying the following information in `datastax.yaml` before deploying:

* the cluster type created for the GKE cluster deployed previously
* the number of nodes in the cluster (if changed from the default 4 nodes)

deploy.sh runs the command:

    gcloud deployment-manager deployments create datastax --config datastax.yaml

## Deleting a Cluster

The [https://cloud.google.com/](https://cloud.google.com/) interface currently has an issue deleting a cluster.  A workaround is provided in the [delete.sh](delete.sh) script.

## Working with a Cluster

A good place to start:

    gcloud container clusters list

With the current configs, our cluster is always called cluster-clustername, so we can get credentials by running:

    gcloud container clusters get-credentials cluster-clustername

Now kubectl will work.  Some helpful commands are:

    kubectl get namespaces
    kubectl get rc
    kubectl get pods

Once you get a pod's name, you can run the following.  Previous is especially useful in debeugging as it shows the logs from the last container that attempted to run.

    kubectl logs datastax-opscenter-rc-5qjv6
    kubectl logs --previous datastax-opscenter-rc-5qjv6
    kubectl describe pod datastax-opscenter-rc-5qjv6

You can also log into the GCE machine running a particular container via SSH and issue docker commands:

    sudo su
    docker ps

To start an interactive shell session on a container (useful for debugging and running nodetool and cqlsh)

    docker exec -i -t 83cddbf5327c /bin/bash

To get the external IP of the OpsCenter machine (running on port 8888) use:

    kubectl get services

This is a great reference for getting started with docker commands: https://docs.docker.com/engine/quickstart/
