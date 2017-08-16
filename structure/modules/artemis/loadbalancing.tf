# Atlas Artemis Module - Load-Balancing

resource "aws_elb" "default" {
  name = "atlas-${var.env_name_short}-${var.name}"

  connection_draining = true
  connection_draining_timeout = 60
  idle_timeout = 3600

  cross_zone_load_balancing = true

  subnets = ["${var.layer_public_subnet_ids}"]

  security_groups = ["${aws_security_group.default_elb.id}"]

  health_check {
    healthy_threshold = 2
    interval = 5
    target = "HTTP:86/_grindr/healthcheck"
    timeout = 2
    unhealthy_threshold = 2
  }

  # see: https://github.com/grindrllc/artemis/wiki/Specification
  listener {
    lb_protocol       = "TCP"
    instance_protocol = "TCP"
    lb_port           = 80
    instance_port     = 84
  }

  listener {
    lb_protocol        = "SSL"
    instance_protocol  = "TCP"
    lb_port            = 443
    instance_port      = 85
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }

  tags {
    Name = "${var.name}.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_project = "${var.project_name}"
    atlas_layer = "public"
    atlas_owner = "isre"
  }
}

# enable TCP proxy protocol on the internal ELB
resource "aws_load_balancer_policy" "proxy" {
  load_balancer_name = "${aws_elb.default.name}"
  policy_name        = "${aws_elb.default.name}-proxy-policy"
  policy_type_name   = "ProxyProtocolPolicyType"
  policy_attribute   = {
    name  = "ProxyProtocol"
    value = "true"
  }
}

# attachment to internal load-balancer
resource "aws_autoscaling_attachment" "internal" {
  elb                    = "${aws_elb.default.id}"
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"
}

# attachment to realtime load-balancer
resource "aws_autoscaling_attachment" "rt" {
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"
  elb                    = "${var.realtime_elb_id}"
}

# attachment to web load-balancer
resource "aws_autoscaling_attachment" "web" {
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"
  elb                    = "${var.web_elb_id}"
}
