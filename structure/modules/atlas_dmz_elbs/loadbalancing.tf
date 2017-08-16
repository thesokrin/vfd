# Atlas DMZ Loadbalancers Module - Load Balancers

# web load balancer resources
resource "aws_elb" "web" {
  name = "atlas-${var.env_name_short}-web"

  internal = false
  subnets = ["${var.layer_dmz_subnet_ids}"]

  cross_zone_load_balancing = "${var.cross_zone_load_balancing}"

  idle_timeout = 3600
  connection_draining = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.web.id}"]

  health_check {
    target = "HTTP:86/_grindr/healthcheck"
    interval = 5
    timeout = 2
    healthy_threshold = 2
    unhealthy_threshold = 2
  }

  # http
  listener {
    lb_protocol       = "HTTP"
    lb_port           = 80
    instance_protocol = "HTTP"
    instance_port     = 80
  }

  # https
  listener {
    lb_protocol        = "HTTPS"
    lb_port            = 443
    instance_protocol  = "HTTP"
    instance_port      = 81
    ssl_certificate_id = "${var.certificate_arn}"
  }

  tags {
    Name = "web.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
    atlas_role = "web"
  }
}

resource "aws_load_balancer_policy" "web_proxy" {
  load_balancer_name = "${aws_elb.web.name}"
  policy_name         = "${aws_elb.web.name}-proxy-policy"
  policy_type_name   = "ProxyProtocolPolicyType"
  policy_attribute   = {
    name  = "ProxyProtocol"
    value = "true"
  }
}


# realtime load balancer resources
resource "aws_elb" "realtime" {
  name = "atlas-${var.env_name_short}-realtime"

  internal = false
  subnets = ["${var.layer_dmz_subnet_ids}"]

  cross_zone_load_balancing = false

  idle_timeout = 3600
  connection_draining = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.realtime.id}"]

  health_check {
    target = "HTTP:86/_grindr/healthcheck"
    interval = 5
    timeout = 2
    healthy_threshold = 2
    unhealthy_threshold = 2
  }

  # http
  listener {
    lb_protocol       = "TCP"
    instance_protocol = "TCP"
    lb_port           = 80
    instance_port     = 82
  }

  # https for web sockets
  listener {
    lb_protocol        = "SSL"
    instance_protocol  = "TCP"
    lb_port            = 443
    instance_port      = 83
    ssl_certificate_id = "${var.certificate_arn}"
  }

  tags {
    Name = "realtime.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
    atlas_role = "realtime"
  }
}

resource "aws_load_balancer_policy" "realtime_proxy" {
  load_balancer_name = "${aws_elb.web.name}"
  policy_name         = "${aws_elb.web.name}-proxy-policy"
  policy_type_name   = "ProxyProtocolPolicyType"
  policy_attribute   = {
    name  = "ProxyProtocol"
    value = "true"
  }
}
