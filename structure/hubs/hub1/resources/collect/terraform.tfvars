aws_account_id = "284224159432"

additional_collect_ingress_cidr_blocks = [
  "10.1.0.0/16",
  "10.50.0.0/16",
  "10.51.0.0/16",
  "10.100.0.0/16"
]

cidr_block = "10.10.0.0/16"

layer_admin_subnet_ids = [
  "subnet-bcf394f5",
  "subnet-705ff72b",
  "subnet-5339e86f"
]

# local influx cluster
metrics_destination = "influx"

# local logstash cluster
logs_destination = "logstash"

private_zone_id = "Z1RCUXX7W0A26O"

reverse_zone_id = "Z3DN439AXT68NJ"

env_name = "hub"
env_name_short = "hub"
env_name_fancy = "Atlas Hub"

vpc_id = "vpc-62e70f04"

zone = "hub.grindr.io"
