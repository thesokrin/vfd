# Atlas Development Environment - Load Balancing Resources - Chat Sieve ELB(s)

resource "aws_elb" "chat_sieve" {
  count = 1

  name = "atlas-dev-chatsieve${count.index + 1}"
  subnets = ["${var.layer_dmz_subnet_ids}"]
  internal = false
  cross_zone_load_balancing = false

  idle_timeout = 3600

  connection_draining = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.chat_sieve_elb.id}"]

  health_check {
    # all set to minimum values
    interval = 5
    timeout = 2
    healthy_threshold = 2
    unhealthy_threshold = 2
    target = "TCP:80"
  }

  # YES, THIS IS THE ONLY WAY TO DO THIS AS OF 2016-11-29
  # start listener definitions
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 0)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 0)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 1)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 1)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 2)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 2)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 3)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 3)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 4)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 4)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 5)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 5)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 6)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 6)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 7)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 7)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 8)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 8)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 9)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 9)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 10)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 10)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 11)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 11)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 12)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 12)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 13)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 13)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 14)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 14)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 15)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 15)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 16)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 16)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 17)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 17)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 18)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 18)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 19)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 19)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 20)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 20)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 21)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 21)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 22)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 22)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 23)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 23)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 24)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 24)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 25)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 25)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 26)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 26)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 27)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 27)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 28)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 28)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 29)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 29)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 30)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 30)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 31)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 31)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 32)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 32)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 33)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 33)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 34)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 34)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 35)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 35)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 36)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 36)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 37)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 37)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 38)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 38)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 39)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 39)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 40)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 40)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 41)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 41)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 42)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 42)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 43)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 43)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 44)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 44)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 45)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 45)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 46)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 46)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 47)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 47)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 48)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 48)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 49)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 49)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 50)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 50)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 51)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 51)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 52)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 52)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 53)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 53)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 54)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 54)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 55)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 55)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 56)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 56)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 57)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 57)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 58)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 58)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 59)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 59)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 60)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 60)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 61)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 61)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 62)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 62)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 63)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 63)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 64)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 64)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 65)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 65)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 66)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 66)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 67)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 67)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 68)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 68)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 69)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 69)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 70)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 70)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 71)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 71)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 72)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 72)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 73)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 73)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 74)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 74)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 75)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 75)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 76)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 76)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 77)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 77)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 78)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 78)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 79)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 79)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 80)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 80)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 81)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 81)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 82)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 82)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 83)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 83)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 84)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 84)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 85)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 85)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 86)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 86)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 87)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 87)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 88)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 88)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 89)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 89)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 90)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 90)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 91)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 91)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 92)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 92)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 93)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 93)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 94)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 94)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 95)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 95)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 96)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 96)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 97)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 97)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 98)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 98)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + 99)}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + 99)}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  # end of listener definitions


  tags {
    Name = "chatsieve${count.index + 1}.dev.grindr.io"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "loadbalancing"
    atlas_owner = "isre"
  }
}
