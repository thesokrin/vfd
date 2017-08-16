# Atlas Layer - Outputs

output "availability_zones" {
  value = ["${aws_subnet.layer.*.availability_zone}"]
}

output "subnet_ids" {
  value = ["${aws_subnet.layer.*.id}"]
}

output "cidr_blocks" {
  value = ["${aws_subnet.layer.*.cidr_block}"]
}

output "route_table_ids" {
  value = ["${aws_route_table.layer.*.id}"]
}

output "network_acl_id" {
  value = "${aws_network_acl.layer.id}"
}
