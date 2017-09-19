# Atlas Development Environment - Mesos Public Workers - Autoscaling Resources

resource "aws_autoscaling_group" "default" {
  name = "mesos-public.${var.zone}-${sha256(aws_launch_configuration.default.id)}"

  health_check_type = "EC2"
  vpc_zone_identifier = ["${var.layer_public_subnet_ids}"]

  min_size = "${var.asg_capacity}"
  max_size = "${var.asg_capacity * 2}"
  desired_capacity = "${var.asg_capacity}"

  launch_configuration = "${aws_launch_configuration.default.id}"

  termination_policies = ["OldestInstance"]

  tag {
    key = "Name"
    value = "mesos-public.${var.zone}"
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
    value = "public"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_project"
    value = "mesos_public_workers"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_role"
    value = "public"
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

# attach to the chat sieve load balancer(s)
resource "aws_autoscaling_attachment" "chat_sieve" {
  count = 1

  elb = "${var.chat_sieve_elb_ids[count.index]}"
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"

  lifecycle {
    create_before_destroy = true
  }
}

# attach to the web load balancer
resource "aws_autoscaling_attachment" "web" {
  elb = "${var.web_elb_id}"
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"

  lifecycle {
    create_before_destroy = true
  }
}
