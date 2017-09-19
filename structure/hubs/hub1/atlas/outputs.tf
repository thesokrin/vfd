# Atlas Hub 1 - Atlas Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "env_id" {
  value = "${var.env_id}"
}

output "env_name" {
  value = "${var.env_name}"
}

output "env_name_short" {
  value = "${var.env_name_short}"
}

output "env_name_fancy" {
  value = "${var.env_name_fancy}"
}

output "exported_modules" {
  value = [
    "dmz_elbs",
    "hub",
    "nat_gateway",
    "vpn",
  ]
}

# Atlas Hub - Outputs
output "availability_zones" {
  value = ["${module.hub.availability_zones}"]
}

output "aws_region" {
  value = "${module.hub.aws_region}"
}

output "autodns_topic_arn" {
  value = "${module.hub.autodns_topic_arn}"
}

output "cidr_block" {
  value = "${module.hub.cidr_block}"
}

output "vpc_id" {
  value = "${module.hub.vpc_id}"
}

output "zone" {
  value = "${module.hub.zone}"
}

output "public_zone_id" {
  value = "${module.hub.public_zone_id}"
}

output "private_zone_id" {
  value = "${module.hub.private_zone_id}"
}

output "reverse_zone_id" {
  value = "${module.hub.reverse_zone_id}"
}

# s3 vpc endpoint
output "s3_endpoint_id" {
  value = "${module.hub.s3_endpoint_id}"
}

output "s3_endpoint_cidr_blocks" {
  value = ["${module.hub.s3_endpoint_cidr_blocks}"]
}

output "s3_endpoint_prefix_list_id" {
  value = "${module.hub.s3_endpoint_prefix_list_id}"
}

# security groups
output "ssh_internal_sg_id" {
  value = "${module.hub.ssh_internal_sg_id}"
}

output "delegation_set_id" {
  value = "${module.hub.delegation_set_id}"
}

output "delegation_set_nameservers" {
  value = ["${module.hub.delegation_set_nameservers}"]
}

# subnet ids of all internet-facing subnets (only in DMZ layer)
output "public_subnet_ids" {
  value = ["${module.hub.public_subnet_ids}"]
}

# export of all public internet-facing route tables (for Internet Gateway routes)
output "public_route_table_ids" {
  value = ["${module.hub.public_route_table_ids}"]
}

# subnet ids of all layers which are not internet-facing
output "private_subnet_ids" {
  value = ["${module.hub.private_subnet_ids}"]
}

# export of all private subnet route tables (for NAT and VPC routes)
output "private_route_table_ids" {
  value = ["${module.hub.private_route_table_ids}"]
}

# Atlas Hub - Outputs for Individual Layers

# dmz
output "layer_dmz_cidr_blocks" {
  value = ["${module.hub.layer_dmz_cidr_blocks}"]
}

output "layer_dmz_subnet_ids" {
  value = ["${module.hub.layer_dmz_subnet_ids}"]
}

# admin
output "layer_admin_cidr_blocks" {
  value = ["${module.hub.layer_admin_cidr_blocks}"]
}

output "layer_admin_subnet_ids" {
  value = ["${module.hub.layer_admin_subnet_ids}"]
}

# public
output "layer_public_cidr_blocks" {
  value = ["${module.hub.layer_public_cidr_blocks}"]
}

output "layer_public_subnet_ids" {
  value = ["${module.hub.layer_public_subnet_ids}"]
}

# services
output "layer_services_cidr_blocks" {
  value = ["${module.hub.layer_services_cidr_blocks}"]
}

output "layer_services_subnet_ids" {
  value = ["${module.hub.layer_services_subnet_ids}"]
}

# data
output "layer_data_cidr_blocks" {
  value = ["${module.hub.layer_data_cidr_blocks}"]
}

output "layer_data_subnet_ids" {
  value = ["${module.hub.layer_data_subnet_ids}"]
}

# net
output "layer_net_cidr_blocks" {
  value = ["${module.hub.layer_net_cidr_blocks}"]
}

output "layer_net_subnet_ids" {
  value = ["${module.hub.layer_net_subnet_ids}"]
}

# Atlas NAT Gateway - Outputs
output "nat_gateway_ids" {
  value = ["${module.nat_gateway.nat_gateway_ids}"]
}

# Atlas VPN - Outputs
output "vpn_cidr_block" {
  value = "${module.vpn.vpn_cidr_block}"
}

output "vpn_gateway_id" {
  value = "${module.vpn.vpn_gateway_id}"
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
