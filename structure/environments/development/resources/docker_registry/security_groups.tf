# Atlas Dev Environment - Docker Registry Security Groups

resource "aws_security_group" "default" {
  name = "registry.${var.zone}"
  description = "Security group for the Docker Registry Load Balancer in the Atlas Dev Environment."
  vpc_id = "${var.vpc_id}"

  ingress {
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_services_cidr_blocks,
      var.layer_public_cidr_blocks
    )}"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "registry.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "services"
    atlas_project = "docker_registry"
    atlas_owner = "isre"
  }
}
