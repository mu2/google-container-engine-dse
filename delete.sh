#!/usr/bin/env bash

gcloud deployment-manager deployments update datastax --config empty.yaml --delete-policy ABANDON
gcloud -q deployment-manager deployments delete datastax
gcloud -q deployment-manager deployments delete cluster
