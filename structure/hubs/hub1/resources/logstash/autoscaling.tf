# Atlas Hub - Logstash Resources - Autoscaling

resource "aws_autoscaling_group" "default" {
  name = "logstash.${var.zone}-${sha256(aws_launch_configuration.default.id)}"

  health_check_type         = "EC2"
  vpc_zone_identifier       = ["${var.layer_services_subnet_ids}"]

  min_size         = "${var.asg_capacity}"
  max_size         = "${var.asg_capacity * 2}"
  desired_capacity = "${var.asg_capacity}"

  launch_configuration = "${aws_launch_configuration.default.id}"

  termination_policies = ["OldestInstance"]

  tag {
    key                 = "Name"
    value               = "logstash.${var.zone}"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_zone"
    value               = "${var.zone}"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_environment"
    value               = "${var.hub_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_layer"
    value               = "services"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_project"
    value               = "logstash"
    propagate_at_launch = true
  }

  tag {
    key                 = "atlas_owner"
    value               = "isre"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "default" {
  elb                    = "${aws_elb.default.id}"
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"

  lifecycle {
    create_before_destroy = true
  }
}
