# Atlas Dev Environment - Docker Registry Load Balancing Resources

resource "aws_elb" "default" {
  name = "atlas-dev-docker-registry"
  subnets = ["${var.layer_services_subnet_ids}"]
  internal = true
  cross_zone_load_balancing = true

  idle_timeout = 3600

  connection_draining = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.default.id}"]

  health_check {
    # all set to minimum values
    interval = 5
    timeout = 2
    healthy_threshold = 2
    unhealthy_threshold = 2
    target = "HTTP:5000/v2/"
  }

  listener {
    lb_protocol = "HTTPS"
    lb_port = 443
    instance_protocol = "HTTP"
    instance_port = 5000
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }

  tags {
    Name = "registry.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "services"
    atlas_project = "docker_registry"
    atlas_owner = "isre"
  }
}
