# Atlas Development Environment - Mesos Services Workers - Autoscaling Resources

resource "aws_autoscaling_group" "default" {
  name = "mesos-services.${var.zone}-${sha256(aws_launch_configuration.default.id)}"

  health_check_type = "EC2"
  vpc_zone_identifier = ["${var.layer_services_subnet_ids}"]

  min_size = "${var.asg_capacity}"
  max_size = "${var.asg_capacity * 2}"
  desired_capacity = "${var.asg_capacity}"

  launch_configuration = "${aws_launch_configuration.default.id}"

  termination_policies = ["OldestInstance"]

  tag {
    key = "Name"
    value = "mesos-services.${var.zone}"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_zone"
    value = "${var.zone}"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_environment"
    value = "${var.env_name}"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_layer"
    value = "services"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_project"
    value = "mesos_services_workers"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_role"
    value = "services"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_owner"
    value = "isre"
    propagate_at_launch = true
  }

  # mesos
  tag {
    key = "role"
    value = "mesos-slave"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# attachment to internal docker registry elb
resource "aws_autoscaling_attachment" "default" {
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"
  elb = "${var.registry_elb_id}"

  lifecycle {
    create_before_destroy = true
  }
}
