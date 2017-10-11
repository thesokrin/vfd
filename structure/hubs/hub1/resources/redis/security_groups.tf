# Atlas Hub 1 - Redis Resources - Security Group Definition

resource "aws_security_group" "default" {
  name        = "redis.${var.zone}"
  description = "Security group for Redis instances in the Atlas Hub."
  vpc_id      = "${var.vpc_id}"


  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [
      "${var.hub_cidr_block}",
      "${var.lahq_cidr_block}"
    ]
  }

  # to redis port
  ingress {
    protocol = "tcp"
    from_port = 6379
    to_port = 6379
    cidr_blocks = ["${concat(
      var.layer_services_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_admin_cidr_blocks
    )}"]
  }

  # egress to anywhere is allowed
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "redis.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer = "data"
    atlas_project = "redis"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
