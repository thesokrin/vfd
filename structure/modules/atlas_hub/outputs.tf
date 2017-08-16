# Atlas Hub - Outputs

output "availability_zones" {
  value = ["${module.stack.availability_zones}"]
}

output "aws_account_id" {
  value = "${module.stack.aws_account_id}"
}

output "aws_region" {
  value = "${module.stack.aws_region}"
}

output "autodns_topic_arn" {
  value = "${module.stack.autodns_topic_arn}"
}

output "cidr_block" {
  value = "${module.stack.cidr_block}"
}

output "vpc_id" {
  value = "${module.stack.vpc_id}"
}

output "zone" {
  value = "${module.stack.zone}"
}

output "public_zone_id" {
  value = "${module.stack.public_zone_id}"
}

output "private_zone_id" {
  value = "${module.stack.private_zone_id}"
}

output "reverse_zone_id" {
  value = "${module.stack.reverse_zone_id}"
}

# s3 vpc endpoint
output "s3_endpoint_id" {
  value = "${module.stack.s3_endpoint_id}"
}

output "s3_endpoint_cidr_blocks" {
  value = ["${module.stack.s3_endpoint_cidr_blocks}"]
}

output "s3_endpoint_prefix_list_id" {
  value = "${module.stack.s3_endpoint_prefix_list_id}"
}

# security groups
output "ssh_internal_sg_id" {
  value = "${module.stack.ssh_internal_sg_id}"
}

output "delegation_set_id" {
  value = "${module.stack.delegation_set_id}"
}

output "delegation_set_nameservers" {
  value = ["${module.stack.delegation_set_nameservers}"]
}

# subnet ids of all internet-facing subnets (only in DMZ layer)
output "public_subnet_ids" {
  value = ["${module.stack.public_subnet_ids}"]
}

# export of all public internet-facing route tables (for Internet Gateway routes)
output "public_route_table_ids" {
  value = ["${module.stack.public_route_table_ids}"]
}

# subnet ids of all layers which are not internet-facing
output "private_subnet_ids" {
  value = ["${module.stack.private_subnet_ids}"]
}

# export of all private subnet route tables (for NAT and VPC routes)
output "private_route_table_ids" {
  value = ["${module.stack.private_route_table_ids}"]
}

# naming information
output "id" {
  value = "${var.id}"
}

output "name" {
  value = "${var.name}"
}

output "name_fancy" {
  value = "${var.name_fancy}"
}

output "name_short" {
  value = "${var.name_short}"
}
