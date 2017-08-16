# Atlas Stack - Outputs

output "availability_zones" {
  value = ["${module.dmz.availability_zones}"]
}

output "aws_account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "aws_region" {
  value = "${data.aws_region.current.name}"
}

output "autodns_topic_arn" {
  value = "${aws_sns_topic.autodns.arn}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "internet_gateway_id" {
  value = "${aws_internet_gateway.internet_gateway.id}"
}

output "cidr_block" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "zone" {
  value = "${var.zone}"
}

output "delegation_set_id" {
  value = "${aws_route53_delegation_set.public.id}"
}

output "delegation_set_nameservers" {
  value = ["${aws_route53_delegation_set.public.name_servers}"]
}

output "public_zone_id" {
  value = "${aws_route53_zone.public.id}"
}

output "private_zone_id" {
  value = "${aws_route53_zone.private.id}"
}

output "reverse_zone_id" {
  value = "${aws_route53_zone.reverse.id}"
}

# s3 vpc endpoint
output "s3_endpoint_id" {
  value = "${aws_vpc_endpoint.s3.id}"
}

output "s3_endpoint_cidr_blocks" {
  value = ["${aws_vpc_endpoint.s3.cidr_blocks}"]
}

output "s3_endpoint_prefix_list_id" {
  value = "${aws_vpc_endpoint.s3.prefix_list_id}"
}

# security groups
output "ssh_internal_sg_id" {
  value = "${aws_security_group.ssh.id}"
}

# subnet ids of all internet-facing subnets (only in DMZ layer)
output "public_subnet_ids" {
  value = ["${module.dmz.subnet_ids}"]
}

# export of all public internet-facing route tables (for Internet Gateway routes)
output "public_route_table_ids" {
  value = ["${module.dmz.route_table_ids}"]
}

# subnet ids of all layers which are not internet-facing
output "private_subnet_ids" {
  value = ["${concat(module.admin.subnet_ids, module.public.subnet_ids, module.services.subnet_ids, module.data.subnet_ids, module.net.subnet_ids)}"]
}

# export of all private subnet route tables (for NAT and VPC routes)
output "private_route_table_ids" {
  value = ["${concat(module.admin.route_table_ids, module.public.route_table_ids, module.services.route_table_ids, module.data.route_table_ids, module.net.route_table_ids)}"]
}
