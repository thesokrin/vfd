# Atlas Hub - Logstash Resources - Load Balancing

resource "aws_elb" "default" {
  name                      = "atlas-hub-logstash"
  subnets                   = ["${var.layer_services_subnet_ids}"]
  internal                  = true
  cross_zone_load_balancing = true

  idle_timeout = 3600

  connection_draining         = true
  connection_draining_timeout = 60

  security_groups = ["${aws_security_group.logstash_elb.id}"]

  health_check {
    # all set to minimum values
    interval            = 5
    timeout             = 2
    healthy_threshold   = 2
    unhealthy_threshold = 2
    target              = "TCP:514"
  }

  listener {
    lb_protocol       = "TCP"
    lb_port           = 514
    instance_protocol = "TCP"
    instance_port     = 514
  }

  tags {
    Name = "logstash.${var.zone}"

    # atlas tags
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer       = "services"
    atlas_project     = "logstash"
    atlas_owner       = "isre"
  }
}
