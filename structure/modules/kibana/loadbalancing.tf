# Atlas Kibana Resources - Load Balancing Resources

resource "aws_elb" "default" {
  name = "atlas-${data.terraform_remote_state.environment.env_name_short}-${var.name}-kibana"
  subnets = ["${data.terraform_remote_state.environment.layer_services_subnet_ids}"]
  internal = true
  cross_zone_load_balancing = true

  idle_timeout = 3600

  connection_draining = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.kibana_elb.id}"]
  instances = ["${aws_instance.default.*.id}"]

  health_check {
    # all set to minimum values
    interval = 5
    timeout = 2
    healthy_threshold = 2
    unhealthy_threshold = 2
    target = "HTTP:5601/"
  }

  listener {
    lb_protocol = "HTTP"
    lb_port = 80
    instance_protocol = "HTTP"
    instance_port = 5601
  }

  tags {
    Name = "${var.name}-kibana.${data.terraform_remote_state.environment.zone}"

    # atlas tags
    atlas_zone        = "${data.terraform_remote_state.environment.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "services"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }
}
