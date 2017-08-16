# Atlas DC/OS Public Workers Module - Autoscaling

resource "aws_autoscaling_group" "default" {
  name = "dcos-public.${var.zone}-${sha256(aws_launch_configuration.default.id)}"

  desired_capacity     = "${var.asg_capacity}"
  health_check_type    = "EC2"
  launch_configuration = "${aws_launch_configuration.default.id}"
  max_size             = "${var.asg_capacity * 2}"
  min_size             = "${var.asg_capacity}"
  termination_policies = ["OldestInstance"]
  vpc_zone_identifier  = ["${var.layer_public_subnet_ids}"]

  tag {
    key                 = "Name"
    value               = "dcos-public.${var.zone}"
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
    value               = "public"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_project"
    value               = "dcos_public_workers"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_role"
    value               = "public"
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

# attach to the web load balancer
resource "aws_autoscaling_attachment" "web" {
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"
  elb                    = "${var.web_elb_id}"

  lifecycle {
    create_before_destroy = true
  }
}
