# rabbitmq Module - Load-Balancing Resources

resource "aws_elb" "rabbitmq" {
  name = "atlas-${var.env_name_short}-rabbitmq"

  connection_draining = true
  connection_draining_timeout = 60
  idle_timeout = 3600

  cross_zone_load_balancing = true

  internal = false
  subnets = ["${var.layer_data_subnet_ids}"]

  security_groups = ["${aws_security_group.rabbitmq_elb.id}"]

  instances = ["${aws_instance.rabbitmq.*.id}"]

  health_check {
    healthy_threshold = 2
    interval = 5
    target = "TCP:5672"
    timeout = 2
    unhealthy_threshold = 2
  }

  listener {
    lb_protocol = "TCP"
    lb_port = 5672
    instance_protocol = "TCP"
    instance_port = 5672

  }

  tags {
    Name = "rabbitmq-lb.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_project = "${var.project_name}"
    atlas_layer = "data"
    atlas_owner = "isre"
  }
}
