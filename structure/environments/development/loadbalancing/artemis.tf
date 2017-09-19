# Atlas Development Environment - Load Balancing Resources - Artemis ELBs

# http web load balancer
resource "aws_elb" "artemis_web" {
  name = "atlas-${var.env_name_short}-artemis-web"

  internal = false
  subnets = ["${var.layer_dmz_subnet_ids}"]

  cross_zone_load_balancing = false

  idle_timeout = 3600
  connection_draining = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.artemis_web_elb.id}"]

  health_check {
    target = "HTTP:83/_grindr/healthcheck"
    interval = 5
    timeout = 2
    healthy_threshold = 2
    unhealthy_threshold = 2
  }

  # http
  listener {
    lb_protocol = "HTTP"
    lb_port = 80
    instance_protocol = "HTTP"
    instance_port = 80
  }

  # https
  listener {
    lb_protocol = "HTTPS"
    lb_port = 443
    instance_protocol = "HTTP"
    instance_port = 81

    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }

  tags {
    Name = "artemis-web.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "loadbalancing"
    atlas_owner = "isre"
    atlas_role = "artemis_web"
  }
}

# web-socket load balancer
resource "aws_elb" "artemis_realtime" {
  name = "atlas-${var.env_name_short}-artemis-realtime"

  internal = false
  subnets = ["${var.layer_dmz_subnet_ids}"]

  cross_zone_load_balancing = false

  idle_timeout = 3600
  connection_draining = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.artemis_realtime_elb.id}"]

  health_check {
    target = "HTTP:83/_grindr/healthcheck"
    interval = 5
    timeout = 2
    healthy_threshold = 2
    unhealthy_threshold = 2
  }

  # http
  listener {
    lb_protocol = "HTTP"
    lb_port = 80
    instance_protocol = "HTTP"
    instance_port = 80
  }

  # https for web sockets
  listener {
    lb_protocol = "HTTPS"
    lb_port = 443
    instance_protocol = "HTTP"
    instance_port = 82

    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }

  tags {
    Name = "artemis-web.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "loadbalancing"
    atlas_owner = "isre"
    atlas_role = "artemis_realtime"
  }
}
