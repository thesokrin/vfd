# Atlas Service Module - Load-Balancing

resource "aws_elb" "internal_elb" {
  name = "atlas-${var.env_name_short}-${var.name}"

  connection_draining         = true
  connection_draining_timeout = "${var.elb_conn_drain_timeout}"
  idle_timeout                = "${var.elb_idle_timeout}"

  cross_zone_load_balancing = true

  subnets = ["${var.layer_services_subnet_ids}"]

  security_groups = ["${aws_security_group.internal_elb.id}"]

  health_check {
    healthy_threshold   = "${var.elb_healthy_threshold}"
    interval            = "${var.elb_interval}"
    target              = "${var.elb_healthcheck_target}"
    timeout             = "${var.elb_timeout}"
    unhealthy_threshold = "${var.elb_unhealthy_threshold}"
  }

  listener {
    lb_protocol = "${var.elb_protocol}"
    lb_port     = "${var.elb_port}"

    instance_protocol = "${var.elb_instance_protocol}"
    instance_port     = "${var.elb_instance_port}"
  }

  tags {
    Name = "${var.name}.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_project     = "${var.project_name}"
    atlas_layer       = "services"
    atlas_owner       = "${var.project_owner}"
  }
}

# attachment to internal load-balancer
resource "aws_autoscaling_attachment" "internal" {
  elb                    = "${aws_elb.internal_elb.id}"
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"
}
