# Atlas Development Environment - Load Balancing Resources - DNS Resources

# airflow
resource "aws_route53_record" "airflow" {
  name = "airflow"
  zone_id = "${var.public_zone_id}"
  type = "A"
  ttl = "300"
  records = ["34.195.66.203"]
}

# artemis web
resource "aws_route53_record" "artemis_web" {
  name = "artemis"
  zone_id = "${var.public_zone_id}"
  type = "A"

  alias {
    name = "${aws_elb.artemis_web.dns_name}"
    zone_id = "${aws_elb.artemis_web.zone_id}"
    evaluate_target_health = true
  }
}

# chat sieve DNS name(s)
resource "aws_route53_record" "chat_sieve" {
  count = 1
  name = "chatsieve${count.index + 1}"
  zone_id = "${var.public_zone_id}"
  type = "A"

  alias {
    name = "${element(aws_elb.chat_sieve.*.dns_name, count.index)}"
    zone_id = "${element(aws_elb.chat_sieve.*.zone_id, count.index)}"
    evaluate_target_health = true
  }
}

# dashboard DNS name
resource "aws_route53_record" "dash" {
  name = "dash"
  zone_id = "${var.public_zone_id}"
  type = "A"

  alias {
    name = "${aws_elb.dash.dns_name}"
    zone_id = "${aws_elb.dash.zone_id}"
    evaluate_target_health = true
  }
}

# artemis real-time
resource "aws_route53_record" "artemis_realtime" {
  name = "rt"
  zone_id = "${var.public_zone_id}"
  type = "A"

  alias {
    name = "${aws_elb.artemis_realtime.dns_name}"
    zone_id = "${aws_elb.artemis_realtime.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "artemis_realtime_cname" {
  name = "realtime"
  zone_id = "${var.public_zone_id}"
  ttl = 300
  type = "CNAME"

  records = ["${aws_route53_record.artemis_realtime.fqdn}"]
}

# wildcard DNS name for default web load balancer
resource "aws_route53_record" "web" {
  name = "*"
  zone_id = "${var.public_zone_id}"
  type = "A"

  alias {
    name = "${aws_elb.web.dns_name}"
    zone_id = "${aws_elb.web.zone_id}"
    evaluate_target_health = true
  }
}
