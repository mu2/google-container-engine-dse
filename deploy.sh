#!/usr/bin/env bash

cd gke
gcloud deployment-manager deployments create cluster --configuration cluster.yaml
gcloud deployment-manager deployments create datastax --configuration datastax.yaml
cd ..
