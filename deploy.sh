#!/usr/bin/env bash

gcloud deployment-manager deployments create cluster --config cluster.yaml
gcloud deployment-manager deployments create datastax --config datastax.yaml
