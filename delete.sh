#!/usr/bin/env bash

echo "resources:" > empty.yaml
gcloud deployment-manager deployments update datastax --config empty.yaml --delete-policy ABANDON
rm empty.yaml

gcloud -q deployment-manager deployments delete datastax
gcloud -q deployment-manager deployments delete cluster
