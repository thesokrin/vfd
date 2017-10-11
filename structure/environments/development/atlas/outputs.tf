# Atlas Development Environment - Atlas Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "env_id" {
  value = "${var.env_id}"
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

output "exported_modules" {
  value = [
    "environment",
    "layer_chat",
    "layer_legacy",
    "nat_gateway",
  ]
}

# Atlas Environment - Outputs
output "availability_zones" {
  value = ["${module.environment.availability_zones}"]
}

output "aws_region" {
  value = "${module.environment.aws_region}"
}

output "autodns_topic_arn" {
  value = "${module.environment.autodns_topic_arn}"
}

output "repo_bucket" {
  value = "${module.environment.repo_bucket}"
}

output "repo_curator_user" {
  value = "${module.environment.repo_curator_user}"
}

# networking
output "vpc_id" {
  value = "${module.environment.vpc_id}"
}

output "cidr_block" {
  value = "${module.environment.cidr_block}"
}

output "vpc_peering_connection_id" {
  value = "${module.environment.vpc_peering_connection_id}"
}

# dns
output "zone" {
  value = "${module.environment.zone}"
}

output "public_zone_id" {
  value = "${module.environment.public_zone_id}"
}

output "private_zone_id" {
  value = "${module.environment.private_zone_id}"
}

output "reverse_zone_id" {
  value = "${module.environment.reverse_zone_id}"
}

output "delegation_set_id" {
  value = "${module.environment.delegation_set_id}"
}

output "delegation_set_nameservers" {
  value = ["${module.environment.delegation_set_nameservers}"]
}

# s3 vpc endpoint
output "s3_endpoint_id" {
  value = "${module.environment.s3_endpoint_id}"
}

output "s3_endpoint_cidr_blocks" {
  value = ["${module.environment.s3_endpoint_cidr_blocks}"]
}

output "s3_endpoint_prefix_list_id" {
  value = "${module.environment.s3_endpoint_prefix_list_id}"
}

# security groups
output "ssh_internal_sg_id" {
  value = "${module.environment.ssh_internal_sg_id}"
}

# subnet ids of all internet-facing subnets (only in DMZ layer)
output "public_subnet_ids" {
  value = ["${module.environment.public_subnet_ids}"]
}

# export of all public internet-facing route tables (for Internet Gateway routes)
output "public_route_table_ids" {
  value = ["${module.environment.public_route_table_ids}"]
}

# subnet ids of all layers which are not internet-facing
output "private_subnet_ids" {
  value = ["${module.environment.private_subnet_ids}"]
}

# export of all private subnet route tables (for NAT and VPC routes)
output "private_route_table_ids" {
  value = ["${module.environment.private_route_table_ids}"]
}

# Atlas Environment - Outputs for Individual Layers
# dmz
output "layer_dmz_cidr_blocks" {
  value = ["${module.environment.layer_dmz_cidr_blocks}"]
}

output "layer_dmz_subnet_ids" {
  value = ["${module.environment.layer_dmz_subnet_ids}"]
}

# admin
output "layer_admin_cidr_blocks" {
  value = ["${module.environment.layer_admin_cidr_blocks}"]
}

output "layer_admin_subnet_ids" {
  value = ["${module.environment.layer_admin_subnet_ids}"]
}

# public
output "layer_public_cidr_blocks" {
  value = ["${module.environment.layer_public_cidr_blocks}"]
}

output "layer_public_subnet_ids" {
  value = ["${module.environment.layer_public_subnet_ids}"]
}

# services
output "layer_services_cidr_blocks" {
  value = ["${module.environment.layer_services_cidr_blocks}"]
}

output "layer_services_subnet_ids" {
  value = ["${module.environment.layer_services_subnet_ids}"]
}

# data
output "layer_data_cidr_blocks" {
  value = ["${module.environment.layer_data_cidr_blocks}"]
}

output "layer_data_subnet_ids" {
  value = ["${module.environment.layer_data_subnet_ids}"]
}

# net
output "layer_net_cidr_blocks" {
  value = ["${module.environment.layer_net_cidr_blocks}"]
}

output "layer_net_subnet_ids" {
  value = ["${module.environment.layer_net_subnet_ids}"]
}

# Atlas NAT Gateway - Outputs
output "nat_gateway_ids" {
  value = ["${module.nat_gateway.nat_gateway_ids}"]
}

# Chat Layer Macro - Outputs

output "chat_availability_zones" {
  value = ["${module.layer_chat.availability_zones}"]
}

output "chat_subnet_ids" {
  value = ["${module.layer_chat.subnet_ids}"]
}

output "chat_cidr_blocks" {
  value = ["${module.layer_chat.cidr_blocks}"]
}

output "chat_route_table_ids" {
  value = ["${module.layer_chat.route_table_ids}"]
}

output "chat_network_acl_id" {
  value = "${module.layer_chat.network_acl_id}"
}

# Legacy Layer Macro - Outputs

output "legacy_availability_zones" {
  value = ["${module.layer_legacy.availability_zones}"]
}

output "legacy_subnet_ids" {
  value = ["${module.layer_legacy.subnet_ids}"]
}

output "legacy_cidr_blocks" {
  value = ["${module.layer_legacy.cidr_blocks}"]
}

output "legacy_route_table_ids" {
  value = ["${module.layer_legacy.route_table_ids}"]
}

output "legacy_network_acl_id" {
  value = "${module.layer_legacy.network_acl_id}"
}

# Atlas DMZ ELBs - Outputs
output "web_elb_id" {
  value = "${module.dmz_elbs.web_elb_id}"
}

output "realtime_elb_id" {
  value = "${module.dmz_elbs.realtime_elb_id}"
}

output "wildcard_certificate_arn" {
  value = "${var.wildcard_certificate_arn}"
}
