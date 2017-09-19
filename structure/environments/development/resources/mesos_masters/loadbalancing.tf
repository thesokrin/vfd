# Atlas Development Environment - Load Balancing Resources

# internal load balancer for mesos masters
resource "aws_elb" "default" {
  name = "atlas-dev-mesos-masters"
  subnets = ["${var.layer_admin_subnet_ids}"]
  internal = true
  cross_zone_load_balancing = true # required for exhibitor discovery?
  security_groups = ["${aws_security_group.loadbalancer.id}"]
  instances = ["${aws_instance.default.*.id}"]

  idle_timeout = 3600

  connection_draining = true
  connection_draining_timeout = 60

  health_check {
    timeout = 2
    interval = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
    target = "HTTP:5050/health"
  }

  # zookeeper
  listener {
    lb_protocol = "TCP"
    lb_port = 2181
    instance_protocol = "TCP"
    instance_port = 2181
  }

  # mesos masters
  listener {
    lb_protocol = "HTTP"
    lb_port = 5050
    instance_protocol = "HTTP"
    instance_port = 5050
  }

  # exhibitor
  listener {
    lb_protocol = "HTTP"
    lb_port = 8181
    instance_protocol = "HTTP"
    instance_port = 8181
  }

  tags {
    Name = "mesos-masters-elb.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "admin"
    atlas_project = "mesos_masters"
    atlas_owner = "isre"
  }
}

# attachment to the dash load balancer in the DMZ
resource "aws_elb_attachment" "dash" {
  count = 3

  elb = "${var.dash_elb_id}"
  instance = "${element(aws_instance.default.*.id, count.index)}"

  lifecycle {
    create_before_destroy = true
  }
}
