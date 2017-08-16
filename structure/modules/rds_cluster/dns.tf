# Atlas RDS Cluster Module - DNS

resource "aws_route53_record" "cluster" {
  zone_id = "${var.private_zone_id}"
  name    = "${var.cluster_id}"
  type    = "CNAME"
  ttl     = "5"

  records = ["${aws_rds_cluster.default.endpoint}"]
}

resource "aws_route53_record" "cluster-read" {
  zone_id = "${var.private_zone_id}"
  name    = "${var.cluster_id}-read"
  type    = "CNAME"
  ttl     = "5"

  records = ["${aws_rds_cluster.default.reader_endpoint}"]
}

resource "aws_route53_record" "masters" {
  count = "${var.masters_instance_count}"

  zone_id = "${var.private_zone_id}"
  name    = "${var.cluster_id}-master-${count.index + 1}"
  type    = "CNAME"
  ttl     = "5"

  records = ["${element(aws_rds_cluster_instance.masters.*.endpoint, count.index)}"]
}

resource "aws_route53_record" "slaves" {
  count = "${var.slaves_instance_count}"

  zone_id = "${var.private_zone_id}"
  name    = "${var.cluster_id}-slave-${count.index + 1}"
  type    = "CNAME"
  ttl     = "5"

  records = ["${element(aws_rds_cluster_instance.slaves.*.endpoint, count.index)}"]
}

resource "aws_route53_record" "reporting" {
  count = "${var.reporting_instance == 1 ? 1 : 0 }"

  zone_id = "${var.private_zone_id}"
  name    = "${var.cluster_id}-reporting"
  type    = "CNAME"
  ttl     = "5"

  records = ["${aws_rds_cluster_instance.reporting.endpoint}"]
}
