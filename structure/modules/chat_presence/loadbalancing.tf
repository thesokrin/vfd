# Chat Presence Module - Load-Balancing Resources

resource "aws_elb" "direct" {
  name = "atlas-${var.env_name_short}-presence-direct"

  connection_draining = true
  connection_draining_timeout = 60
  idle_timeout = 90

  cross_zone_load_balancing = true

  internal = false
  subnets = ["${var.layer_dmz_subnet_ids}"]

  security_groups = ["${aws_security_group.direct_elb.id}"]

  instances = ["${aws_instance.default.*.id}"]

  health_check {
    healthy_threshold = 2
    interval = 5
    target = "HTTP:9000/info/health"
    timeout = 2
    unhealthy_threshold = 2
  }

  listener {
    lb_protocol = "SSL"
    lb_port = 443

    instance_protocol = "TCP"
    instance_port = 4000

    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }

  tags {
    Name = "presence-direct-elb.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_project = "${var.project_name}"
    atlas_layer = "dmz"
    atlas_owner = "${var.project_owner}"
  }
}
