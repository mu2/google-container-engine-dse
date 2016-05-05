gcloud deployment-manager deployments update cassandra --config empty.yaml --delete-policy ABANDON
gcloud deployment-manager deployments delete cassandra
gcloud deployment-manager deployments delete cluster

