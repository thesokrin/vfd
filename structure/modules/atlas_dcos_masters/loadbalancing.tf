# Atlas DC/OS Masters Module - Load Balancing Resources

# internal load balancer for dcos masters
resource "aws_elb" "default" {
  name                        = "atlas-${var.stack_name_short}-dcos-masters"
  connection_draining         = true
  connection_draining_timeout = 60
  cross_zone_load_balancing   = true
  idle_timeout                = 3600
  instances                   = ["${aws_instance.default.*.id}"]
  internal                    = true
  security_groups             = ["${aws_security_group.loadbalancer.id}"]
  subnets                     = ["${var.layer_admin_subnet_ids}"]

  health_check {
    healthy_threshold   = 2
    interval            = 5
    target              = "HTTP:5050/health"
    timeout             = 2
    unhealthy_threshold = 2
  }

  # zookeeper
  listener {
    instance_port     = 2181
    instance_protocol = "TCP"
    lb_port           = 2181
    lb_protocol       = "TCP"
  }

  # dcos masters
  listener {
    instance_port     = 5050
    instance_protocol = "HTTP"
    lb_port           = 5050
    lb_protocol       = "HTTP"
  }

  # exhibitor
  listener {
    instance_port     = 8181
    instance_protocol = "HTTP"
    lb_port           = 8181
    lb_protocol       = "HTTP"
  }

  tags {
    Name = "dcos-masters-elb.${var.zone}"

    # atlas variables
    atlas_environment = "${var.stack_name}"
    atlas_layer       = "admin"
    atlas_owner       = "isre"
    atlas_project     = "dcos_masters"
    atlas_zone        = "${var.zone}"
  }
}

# attachment to the dash load balancer in the DMZ
resource "aws_elb_attachment" "dash" {
  count = 3

  elb      = "${var.dash_elb_id}"
  instance = "${element(aws_instance.default.*.id, count.index)}"

  lifecycle {
    create_before_destroy = true
  }
}
