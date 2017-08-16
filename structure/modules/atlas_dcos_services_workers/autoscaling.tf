# Atlas DC/OS Services Workers Module - Autoscaling

resource "aws_autoscaling_group" "default" {
  name = "dcos-services.${var.zone}-${sha256(aws_launch_configuration.default.id)}"

  desired_capacity     = "${var.asg_capacity}"
  health_check_type    = "EC2"
  launch_configuration = "${aws_launch_configuration.default.id}"
  max_size             = "${var.asg_capacity * 2}"
  min_size             = "${var.asg_capacity}"
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier  = ["${var.layer_services_subnet_ids}"]

  tag {
    key                 = "Name"
    value               = "dcos-services.${var.zone}"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_zone"
    value               = "${var.zone}"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_environment"
    value               = "${var.stack_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_layer"
    value               = "services"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_project"
    value               = "dcos_services_workers"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_role"
    value               = "services"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_owner"
    value               = "isre"
    propagate_at_launch = true
  }

  # mesos
  tag {
    key                 = "role"
    value               = "mesos-slave"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
