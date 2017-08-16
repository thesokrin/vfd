# Atlas RDS Cluster Module - Outputs

output "cluster_id" {
  value = "${aws_rds_cluster.default.id}"
}

output "masters" {
  value = ["${aws_route53_record.masters.*.fqdn}"]
}

output "slaves" {
  value = ["${aws_route53_record.slaves.*.fqdn}"]
}

output "endpoint_reporting" {
  value = "${aws_route53_record.reporting.fqdn}"
}

output "endpoint_read" {
  value = "${aws_route53_record.cluster-read.fqdn}"
}

output "endpoint_write" {
  value = "${aws_route53_record.cluster.fqdn}"
}

output "database_name" {
  value = "${var.database_name}"
}

output "database_port" {
  value = "${var.database_port}"
}

output "username" {
  value = "${var.username}"
}

output "password" {
  sensitive = true
  value     = "${var.password}"
}
