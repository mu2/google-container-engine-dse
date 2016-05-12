# google-container-engine-dse
Google Deployment Manager scripts for deploying DataStax Enterprise (DSE) on Google Container Engine (GKE)

These don't work yet.  Sorry.  Something isn't right with the OpsCenter node and we're having issues getting a startup script to run using command.  Some nodes are setup but DSE is not installed.

## Getting started

Deploying to GKE is a two step process.  The [deploy.sh](deploy.sh) script wraps both the deploy cluster and deploy DataStax commands.

### Deploy a cluster

Using `cluster.yaml`, deploy a GKE cluster to use for deploying the solution
later. Consider modifying the following information before deploying:

* desired cluster name
* basicauth username and password for authenticating access to the cluster

deploy.sh runs the command:

    gcloud deployment-manager deployments create cluster --config cluster.yaml

This will result in two resources:

* a GKE cluster with the name specified in `cluster.yaml`
* a Deployment Manager type named `<deployment-name>-<cluster-name>-type`

### Deploying DataStax

Using `datastax.yaml`, deploy to the GKE cluster created in the last step.
Consider modifying the following information before deploying:

* the cluster type created for the GKE cluster deployed previously
* the number of nodes in the cluster (if changed from the default 4 nodes)

deploy.sh runs the command:

    gcloud deployment-manager deployments create datastax --config datastax.yaml

## Deleting a Cluster

The [https://cloud.google.com/](https://cloud.google.com/) interface currently has an issue deleting a cluster.  A workaround is provided in the [delete.sh](delete.sh) script.

## Misc Commands

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
    kubectl describe pod kubernetes-dashboard-v1.0.1-7g62n --namespace=kube-system

You can also log into the GCE machine running a particular container and issue docker commands:

    sudo su
    docker ps

To get the external IP of the OpsCenter machine (running on port 8888) use:

    kubectl get services

This is a great reference for getting started with docker commands: https://docs.docker.com/engine/quickstart/

To start an interactive shell session on a container, ssh to the host GCE box and then run:

    docker exec -i -t 83cddbf5327c /bin/bash