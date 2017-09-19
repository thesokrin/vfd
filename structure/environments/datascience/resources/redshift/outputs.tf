# Atlas Data-Science Environment - Redshift Cluster Resources - Outputs

output "availability_zone" {
  value = "${aws_redshift_cluster.default.availability_zone}"
}

output "redshift_cluster_id" {
  value = "${var.redshift_cluster_id}"
}

output "redshift_cluster_public_key" {
  value = "${aws_redshift_cluster.default.cluster_public_key}"
}

output "redshift_database" {
  value = "${var.redshift_database}"
}

output "redshift_database_port" {
  value = "${var.redshift_database_port}"
}

output "redshift_endpoint" {
  value = "${aws_redshift_cluster.default.endpoint}"
}

output "redshift_id" {
  value = "${aws_redshift_cluster.default.id}"
}

output "redshift_password" {
  sensitive = true
  value     = "${var.redshift_database}"
}

output "redshift_username" {
  value = "${var.redshift_username}"
}
