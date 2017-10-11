# Atlas Hub - Logstash Resources - Security Groups

resource "aws_security_group" "default" {
  name        = "logstash.${var.zone}"
  description = "Security group for Logstash instances in the Atlas Hub."
  vpc_id      = "${var.vpc_id}"

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22

    cidr_blocks = [
      "${var.hub_cidr_block}",
      "${var.lahq_cidr_block}",
    ]
  }

  # to logstash syslog 514
  ingress {
    protocol    = "tcp"
    from_port   = 514
    to_port     = 514
    cidr_blocks = ["${var.layer_services_cidr_blocks}"]
  }

  # egress to anywhere is allowed
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "logstash.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer       = "services"
    atlas_project     = "logstash"
    atlas_owner       = "isre"
  }
}

resource "aws_security_group" "logstash_elb" {
  name        = "logstash-elb.${var.zone}"
  description = "Security group for the Logstash internal load balancer in the Atlas Hub."
  vpc_id      = "${var.vpc_id}"

  # to logstash syslog 514
  ingress {
    protocol    = "tcp"
    from_port   = 514
    to_port     = 514
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # egress to anywhere is allowed
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "logstash.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer       = "services"
    atlas_project     = "logstash"
    atlas_owner       = "isre"
  }
}
