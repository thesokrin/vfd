# Atlas Redis Cluster Module - Outputs

output "name" {
  value = "${var.name}"
}

output "env_name" {
  value = "${var.env_name}"
}

output "env_name_fancy" {
  value = "${var.env_name_fancy}"
}

output "env_name_short" {
  value = "${var.env_name_short}"
}

output "primary_node_count" {
  value = "3"
}

output "write_dns" {
  value = "${module.cluster_dns.write_dns}"
}

output "read_dns" {
  value = "${module.cluster_dns.read_dns}"
}

output "replica_count_per_primary" {
  value = "${var.replica_count_per_primary}"
}
