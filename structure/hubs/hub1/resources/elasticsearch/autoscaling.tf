# Atlas Hub - Elasticsearch Resources - Autoscaling

resource "aws_autoscaling_group" "default" {
  name = "elasticsearch.${var.zone}-${sha256(aws_launch_configuration.default.id)}"

  health_check_type = "ELB"
  health_check_grace_period = 600 # 10 minutes
  wait_for_elb_capacity = "${floor(var.asg_capacity / 2) + 1}"

  vpc_zone_identifier = ["${var.layer_data_subnet_ids}"]

  min_size = "${var.asg_capacity}"
  max_size = "${var.asg_capacity * 2}"
  desired_capacity = "${var.asg_capacity}"

  launch_configuration = "${aws_launch_configuration.default.id}"

  termination_policies = ["OldestInstance"]

  tag {
    key = "Name"
    value = "elasticsearch.${var.zone}"
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
    value = "${var.hub_name}"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_layer"
    value = "data"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_project"
    value = "elasticsearch"
    propagate_at_launch = true
  }

  tag {
    key = "atlas_owner"
    value = "isre"
    propagate_at_launch = true
  }

  # elasticsearch tags
  tag {
    key = "elasticsearch_cluster"
    value = "${var.elasticsearch_cluster_id}"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
