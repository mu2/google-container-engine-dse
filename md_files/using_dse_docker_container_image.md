### Using DSE docker container image

#### Configure DSE docker container's environment variables

Variable | Setting        | Description                
------------ | ----------------- | -------------------- 
`DS_LICENSE` | accept | **Required**. Set to accept to acknowledge that you agree with the terms of the DataStax license. To show the license, set the variable `DS_LICENSE` to the value `accept`. *The image only starts if the variable set to accept.*
`LISTEN_ADDRESS` | *IP_address* | The IP address to listen for connections from other nodes. Defaults to the container's IP address.
`BROADCAST_ADDRESS` | *IP_address* | The IP address to advertise to other nodes. Defaults to the same value as the `LISTEN_ADDRESS`.
`RPC_ADDRESS` |*IP_address* | The IP address to listen for client/driver connections. Default: `0.0.0.0`.
`BROADCAST_RPC_ADDRESS` | *IP_address* | The IP address to advertise to clients/drivers. Defaults to the same value as the `BROADCAST_ADDRESS`.
`SEEDS` | *IP_address* | The comma-delimited list of seed nodes for the cluster. Defaults to this node's `BROADCAST_ADDRESS`. 
`START_RPC` | `true` \| `false` | Whether or not to start the Thrift RPC server. Will leave the default in the `cassandra.yaml` file if not set.
`CLUSTER_NAME` | *string* | The name of the cluster. Default: `Test Cluster`.
`NUM_TOKENS`|*int*|The number of tokens randomly assigned to the node. Default: `8`.
`DC` | *string* | Datacenter name. Default: `Cassandra`.
`RACK` | *string* | Rack name. Default: `rack1`.
`DSE_DATA` | *string* | **Required**. Directoy path for storing DSE data. For example, a directory named "/dse-data" will be created on the docker container if the value of DSE_DATA is dse-data.

