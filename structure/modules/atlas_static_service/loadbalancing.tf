# static_service Module - Load-Balancing Resources

resource "aws_elb" "default" {
  count = "${var.create_elb}"
  name  = "atlas-${data.terraform_remote_state.environment.env_name_short}-${var.name}"

  connection_draining         = true
  connection_draining_timeout = "${var.elb_conn_drain_timeout}"
  idle_timeout                = "${var.elb_idle_timeout}"

  cross_zone_load_balancing = true

  subnets = ["${data.terraform_remote_state.environment.layer_services_subnet_ids}"]

  security_groups = ["${aws_security_group.loadbalancer.id}"]

  instances = ["${aws_instance.default.*.id}"]

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
    Name = "${var.name}.${data.terraform_remote_state.environment.zone}"

    # atlas variables
    atlas_zone        = "${data.terraform_remote_state.environment.zone}"
    atlas_environment = "${data.terraform_remote_state.environment.env_name}"
    atlas_project     = "${var.project_name}"
    atlas_layer       = "services"
    project_owner     = "${var.project_owner}"
  }
}
