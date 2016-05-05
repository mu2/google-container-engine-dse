gcloud deployment-manager deployments update cassandra --config empty.yaml --delete-policy ABANDON
gcloud -q deployment-manager deployments delete cassandra
gcloud -q deployment-manager deployments delete cluster

