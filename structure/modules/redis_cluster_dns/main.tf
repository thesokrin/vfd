# Atlas Redis Cluster DNS Module

# primary pool records
resource "aws_route53_record" "primary_pool" {
  # example: redis
  name    = "${var.name}"
  type    = "A"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${var.primary_ips}"]
}

resource "aws_route53_record" "primary_srv" {
  # example: redis
  name    = "${var.name}"
  type    = "SRV"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${formatlist("0 100 6379 %s", var.primary_dns_names)}"]
}

resource "aws_route53_record" "write_alias" {
  # example: redis-write
  name    = "${var.name}-write"
  type    = "CNAME"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${var.name}"]
}

# replica pool records
resource "aws_route53_record" "replica_pool" {
  # example: redis-read
  name    = "${var.name}-read"
  type    = "A"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${var.replica_ips}"]
}

resource "aws_route53_record" "replica_pool_srv" {
  # example: redis-read
  name    = "${var.name}-read"
  type    = "SRV"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${formatlist("0 100 6379 %s", var.replica_dns_names)}"]
}
