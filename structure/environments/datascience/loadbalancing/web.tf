# Atlas Data-Science Environment - Public Load-Balancing Resources - Web Load Balancer

resource "aws_elb" "web" {
  name                      = "atlas-dsci-web"
  subnets                   = ["${var.layer_dmz_subnet_ids}"]
  internal                  = false
  cross_zone_load_balancing = true

  idle_timeout = 3600

  connection_draining         = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.web_elb.id}"]

  health_check {
    # all set to minimum values
    interval            = 5
    timeout             = 2
    healthy_threshold   = 2
    unhealthy_threshold = 2
    target              = "TCP:80"
  }

  listener {
    lb_protocol       = "TCP"
    lb_port           = 80
    instance_protocol = "TCP"
    instance_port     = 80
  }

  listener {
    lb_protocol        = "SSL"
    lb_port            = 443
    instance_protocol  = "TCP"
    instance_port      = 80
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }

  tags {
    Name = "web.${var.zone}"

    # atlas tags
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "dmz"
    atlas_project     = "loadbalancing"
    atlas_owner       = "isre"
  }
}
