# Atlas Redis Cluster Module

Creates a Redis Cluster with three fixed primaries and a variable number of replicas per primary.

## Example

To use this module, please create an Atlas Project and declare a single block for loading the redis_cluster module. The system
is limited to making a fixed sized cluster of 3 shards that's managed here. The module will figure out the details
from the provided values.

```
# environments/staging/resources/redis_cluster/main.tf

module "redis" {
  source = "../../../../modules/redis_cluster"

  # inputs
  replica_count_per_primary   = "${var.replica_count_per_primary}"
  cidr_block                 = "${var.env_cidr_block}"
  env_name                   = "${var.env_name}"
  env_name_fancy             = "${var.env_name_fancy}"
  env_name_short             = "${var.env_name_short}"
  layer_admin_cidr_blocks    = ["${var.layer_admin_cidr_blocks}"]
  layer_data_cidr_blocks     = ["${var.layer_data_cidr_blocks}"]
  layer_data_subnet_ids      = ["${var.layer_data_subnet_ids}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  private_zone_id            = "${var.private_zone_id}"
  reverse_zone_id            = "${var.reverse_zone_id}"
  vpc_id                     = "${var.vpc_id}"
  zone                       = "${var.zone}"
}
```
