# Atlas Artemis Module - Autoscaling

resource "aws_autoscaling_group" "default" {
  name = "${var.name}.${var.zone}-${sha256(aws_launch_configuration.default.id)}"

  health_check_type = "ELB"

  vpc_zone_identifier = ["${var.layer_public_subnet_ids}"]

  min_size = "${var.capacity}"
  max_size = "${var.capacity * 2}"
  desired_capacity = "${var.capacity}"

  wait_for_elb_capacity = "${var.capacity}"
  wait_for_capacity_timeout = "20m"

  launch_configuration = "${aws_launch_configuration.default.id}"

  termination_policies = ["OldestInstance"]

  tag {
    key = "Name"
    value = "${var.name}.${var.zone}"
    propagate_at_launch = true
  }

  # atlas tags
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
    value = "${var.project_name}"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_owner"
    value = "${var.project_owner}"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
