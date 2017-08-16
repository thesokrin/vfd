# Atlas Collect Module - Security Groups

resource "aws_security_group" "default" {
  name = "collect.${var.zone}"
  description = "Security group for Collect instances in the ${var.stack_name_fancy}."
  vpc_id = "${var.vpc_id}"

  # ssh inbound
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["${var.cidr_block}"]
  }

  # ingress to syslog TCP
  ingress {
    protocol = "tcp"
    from_port = 514
    to_port = 514
    cidr_blocks = ["${concat(
      list(var.cidr_block),
      var.additional_collect_ingress_cidr_blocks
    )}"]
  }

  # ingress to syslog UDP
  ingress {
    protocol = "udp"
    from_port = 514
    to_port = 514
    cidr_blocks = ["${concat(
      list(var.cidr_block),
      var.additional_collect_ingress_cidr_blocks
    )}"]
  }

  # ingress to graphite TCP line protocol
  ingress {
    protocol = "tcp"
    from_port = 2003
    to_port = 2003
    cidr_blocks = ["${concat(
      list(var.cidr_block),
      var.additional_collect_ingress_cidr_blocks
    )}"]
  }

  # ingress to graphite UDP line protocol
  ingress {
    protocol = "udp"
    from_port = 2003
    to_port = 2003
    cidr_blocks = ["${concat(
      list(var.cidr_block),
      var.additional_collect_ingress_cidr_blocks
    )}"]
  }

  # ingress to graphite TCP pickle protocol
  ingress {
    protocol = "tcp"
    from_port = 2004
    to_port = 2004
    cidr_blocks = ["${concat(
      list(var.cidr_block),
      var.additional_collect_ingress_cidr_blocks
    )}"]
  }

  # egress anywhere
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "collect.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.stack_name}"
    atlas_layer = "admin"
    atlas_project = "collect"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
