# Atlas Redis Cluster Shard Module - DNS Resources

# primary records
resource "aws_route53_record" "primary_private" {
  # example: redis-1
  name    = "${var.name}-${var.shard_id}"
  type    = "A"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${aws_instance.primary.private_ip}"]
}

resource "aws_route53_record" "primary_reverse" {
  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", aws_instance.primary.private_ip), 3),
    element(split(".", aws_instance.primary.private_ip), 2),
    element(split(".", aws_instance.primary.private_ip), 1)
  )}"

  type    = "PTR"
  ttl     = "5"
  zone_id = "${var.reverse_zone_id}"
  records = ["${aws_route53_record.primary_private.fqdn}"]
}


# replica records
resource "aws_route53_record" "replica_private" {
  count = "${var.replica_count}"

  # example: redis-1-r1
  name    = "${var.name}-${var.shard_id}-r${count.index + 1}"
  type    = "A"
  ttl     = 60
  zone_id = "${var.private_zone_id}"
  records = ["${element(aws_instance.replica.*.private_ip, count.index)}"]
}

resource "aws_route53_record" "replica_reverse" {
  count = "${var.replica_count}"

  name = "${format("%s.%s.%s.10.in-addr.arpa",
    element(split(".", element(aws_instance.replica.*.private_ip, count.index)), 3),
    element(split(".", element(aws_instance.replica.*.private_ip, count.index)), 2),
    element(split(".", element(aws_instance.replica.*.private_ip, count.index)), 1)
  )}"

  type    = "PTR"
  ttl     = "5"
  zone_id = "${var.reverse_zone_id}"
  records = ["${element(aws_route53_record.replica_private.*.fqdn, count.index)}"]
}


# pool records
resource "aws_route53_record" "replica_pool_private" {
  name    = "${var.name}-${var.shard_id}-read"
  type    = "A"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${aws_instance.replica.*.private_ip}"]
}

resource "aws_route53_record" "replica_pool_srv" {
  name    = "${var.name}-${var.shard_id}-read"
  type    = "SRV"
  ttl     = "5"
  zone_id = "${var.private_zone_id}"
  records = ["${formatlist("0 100 6379 %s", aws_route53_record.replica_private.*.fqdn)}"]
}
