# Atlas Hub 1 - Kibana Resources - Load Balancing

resource "aws_elb" "default" {
  name = "atlas-hub-kibana"
  subnets = ["${var.layer_services_subnet_ids}"]
  internal = true
  cross_zone_load_balancing = true

  idle_timeout = 3600

  connection_draining = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.kibana_elb.id}"]

  health_check {
    # all set to minimum values
    interval = 5
    timeout = 2
    healthy_threshold = 2
    unhealthy_threshold = 2
    target = "HTTP:80/"
  }

  listener {
    lb_protocol = "HTTP"
    lb_port = 80
    instance_protocol = "HTTP"
    instance_port = 80
  }

  tags {
    Name = "kibana.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer = "services"
    atlas_project = "kibana"
    atlas_owner = "isre"
  }
}
