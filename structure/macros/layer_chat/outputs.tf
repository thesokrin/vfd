# Chat Layer Macro - Outputs

output "availability_zones" {
  value = ["${module.layer.availability_zones}"]
}

output "subnet_ids" {
  value = ["${module.layer.subnet_ids}"]
}

output "cidr_blocks" {
  value = ["${module.layer.cidr_blocks}"]
}

output "route_table_ids" {
  value = ["${module.layer.route_table_ids}"]
}

output "network_acl_id" {
  value = "${module.layer.network_acl_id}"
}
