# Atlas Hub 1 - Redis Resources - DNS Route53

resource "aws_route53_record" "redis_master" {
  name = "redis-master"
  zone_id = "${var.private_zone_id}"
  type = "A"
  ttl = "10"
  records = ["${aws_instance.master.private_ip}"]
}

resource "aws_route53_record" "redis_slave" {
  name = "redis-slave"
  zone_id = "${var.private_zone_id}"
  type = "A"
  ttl = "10"
  records = ["${aws_instance.slave.private_ip}"]
}


resource "aws_route53_record" "redis" {
  name = "redis"
  zone_id = "${var.private_zone_id}"
  type = "CNAME"
  ttl = "10"
  records = ["${aws_route53_record.redis_master.fqdn}"]
}
