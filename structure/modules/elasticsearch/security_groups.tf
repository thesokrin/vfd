# Atlas Elasticsearch Module - Security Group Resources

resource "aws_security_group" "default" {
  name = "${var.name}.${var.zone}"
  description = "Security group for Elasticsearch (${var.name}) instances in the ${var.env_name_fancy}."

  vpc_id = "${var.vpc_id}"

  # ssh internal
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["${var.cidr_block}"]
  }

  # http transport
  ingress {
    protocol = "tcp"
    from_port = 9200
    to_port = 9200
    cidr_blocks = ["${concat(
       var.layer_admin_cidr_blocks,
       var.layer_data_cidr_blocks,
       var.layer_services_cidr_blocks,
       var.additional_http_transport_cidr_blocks
     )}"]
  }

  # node transport
  ingress {
    protocol = "tcp"
    from_port = 9300
    to_port = 9300
    cidr_blocks = ["${concat(
      list(var.cidr_block),
      var.layer_admin_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_services_cidr_blocks,
      var.additional_tcp_transport_cidr_blocks
    )}"]
  }

  # cerebro
  ingress {
    protocol = "tcp"
    from_port = 9000
    to_port = 9000
    cidr_blocks = ["${concat(
      var.layer_data_cidr_blocks
    )}"]
  }

  # egress to anywhere
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "data"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "elb" {
  name = "${var.name}-elb.${var.zone}"
  description = "Security group for the Elasticsearch (${var.name}) load balancer in the ${var.env_name_fancy}."

  vpc_id = "${var.vpc_id}"

  # http transport
  ingress {
    protocol = "tcp"
    from_port = 9200
    to_port = 9200
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_services_cidr_blocks,
      var.additional_http_transport_cidr_blocks
    )}"]
  }

  # node transport
  ingress {
    protocol = "tcp"
    from_port = 9300
    to_port = 9300
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_services_cidr_blocks,
      var.additional_tcp_transport_cidr_blocks
    )}"]
  }

  # cerebro
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 9000
    cidr_blocks = ["${concat(
       var.layer_public_cidr_blocks
    )}"]
  }

  # egress to anywhere
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "data"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }
}
