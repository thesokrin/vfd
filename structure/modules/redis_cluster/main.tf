# Atlas Redis Cluster Module

module "cluster_resources" {
  source = "../redis_cluster_resources"
  # variables
  name           = "${var.name}"
  env_name       = "${var.env_name}"
  env_name_short = "${var.env_name_short}"
  env_name_fancy = "${var.env_name_fancy}"

  cidr_block                 = "${var.cidr_block}"
  layer_admin_cidr_blocks    = ["${var.layer_admin_cidr_blocks}"]
  layer_data_cidr_blocks     = ["${var.layer_data_cidr_blocks}"]
  layer_services_cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  additional_cidr_blocks     = ["${var.additional_cidr_blocks}"]

  private_zone_id = "${var.private_zone_id}"
  reverse_zone_id = "${var.reverse_zone_id}"
  zone            = "${var.zone}"

  vpc_id = "${var.vpc_id}"
}

module "cluster_dns" {
  source = "../redis_cluster_dns"
  # variables
  name            = "${var.name}"
  private_zone_id = "${var.private_zone_id}"
  zone            = "${var.zone}"

  # shard info
  primary_dns_names      = [
    "${module.shard_1.primary_dns}",
    "${module.shard_2.primary_dns}",
    "${module.shard_3.primary_dns}",
  ]
  primary_ips            = [
    "${module.shard_1.primary_ip}",
    "${module.shard_2.primary_ip}",
    "${module.shard_3.primary_ip}",
  ]

  replica_dns_names      = ["${concat(
    module.shard_1.replica_dns_names,
    module.shard_2.replica_dns_names,
    module.shard_3.replica_dns_names,
  )}"]
  replica_pool_dns_names = [
    "${module.shard_1.replica_pool_dns_name}",
    "${module.shard_2.replica_pool_dns_name}",
    "${module.shard_3.replica_pool_dns_name}",
  ]
  replica_ips            = ["${concat(
    module.shard_1.replica_ips,
    module.shard_2.replica_ips,
    module.shard_3.replica_ips
  )}"]
}
