# Atlas Development Environment - Load Balancing Resources - Dashboard ELB

resource "aws_elb" "dash" {
  name = "atlas-dev-dash"
  subnets = ["${var.layer_dmz_subnet_ids}"]
  internal = false
  cross_zone_load_balancing = false

  idle_timeout = 3600

  connection_draining = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.dash_elb.id}"]

  health_check {
    # all set to minimum values
    interval = 5
    timeout = 2
    healthy_threshold = 2
    unhealthy_threshold = 2
    target = "HTTP:80/"
  }

  listener {
    lb_protocol = "HTTPS"
    lb_port = 443
    instance_protocol = "HTTP"
    instance_port = 80
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }

  tags {
    Name = "dash.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "loadbalancing"
    atlas_owner = "isre"
  }
}
