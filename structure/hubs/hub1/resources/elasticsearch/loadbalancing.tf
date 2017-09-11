# Atlas Hub - Elasticsearch Resources - Load-Balancing

resource "aws_elb" "default" {
  name = "atlas-hub-elasticsearch"
  subnets = ["${var.layer_data_subnet_ids}"]
  internal = true
  cross_zone_load_balancing = true
  security_groups = ["${aws_security_group.elb.id}"]

  idle_timeout = 3600

  connection_draining = true
  connection_draining_timeout = 60

  health_check {
    timeout = 2
    interval = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
    target = "HTTP:9200/"
  }

  # http transport
  listener {
    lb_protocol = "HTTP"
    lb_port = 9200
    instance_protocol = "HTTP"
    instance_port = 9200
  }

  # node transport
  listener {
    lb_protocol = "TCP"
    lb_port = 9300
    instance_protocol = "TCP"
    instance_port = 9300
  }

  tags {
    Name = "elasticsearch-elb.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer = "data"
    atlas_project = "elasticsearch"
    atlas_owner = "isre"
  }
}

resource "aws_autoscaling_attachment" "default" {
  autoscaling_group_name = "${aws_autoscaling_group.default.id}"
  elb = "${aws_elb.default.id}"

  lifecycle {
    create_before_destroy = true
  }
}
