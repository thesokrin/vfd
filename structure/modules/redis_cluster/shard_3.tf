# Atlas Redis Cluster - Shard 3 Resources

module "shard_3" {
  source = "../redis_cluster_shard"
  # variables
  name           = "${var.name}"
  env_name       = "${var.env_name}"
  env_name_fancy = "${var.env_name_fancy}"
  env_name_short = "${var.env_name_short}"
  project_name   = "${var.project_name}"
  project_owner  = "${var.project_owner}"

  ami_id          = "${var.ami_id}"
  ec2_key_name    = "${var.ec2_key_name}"
  role_package    = "${var.role_package}"
  private_zone_id = "${var.private_zone_id}"
  reverse_zone_id = "${var.reverse_zone_id}"
  zone            = "${var.zone}"

  # generic
  primary_instance_type    = "${var.primary_instance_type}"
  primary_root_volume_size = "${var.primary_root_volume_size}"
  primary_root_volume_type = "${var.primary_root_volume_type}"

  replica_count            = "${var.replica_count_per_primary}"
  replica_instance_type    = "${var.replica_instance_type}"
  replica_root_volume_size = "${var.replica_root_volume_size}"
  replica_root_volume_type = "${var.replica_root_volume_type}"

  # wired from cluster_resources
  iam_instance_profile = "${module.cluster_resources.iam_instance_profile}"
  security_group_ids   = ["${module.cluster_resources.security_group_id}"]

  # per shard settings
  shard_id = "${var.shard_indices[2] + 1}"

  primary_subnet_id        = "${var.layer_data_subnet_ids[
    var.shard_indices[2] % length(var.layer_data_subnet_ids)
  ]}"

  # rotate replicas around availability zones per primary
  replica_subnet_ids       = ["${
    concat(
      slice(var.layer_data_subnet_ids, var.shard_indices[2] + 1 % length(var.layer_data_subnet_ids), length(var.layer_data_subnet_ids)),
      slice(var.layer_data_subnet_ids, 0, var.shard_indices[2] + 1 % length(var.layer_data_subnet_ids))
    )
  }"]
}
