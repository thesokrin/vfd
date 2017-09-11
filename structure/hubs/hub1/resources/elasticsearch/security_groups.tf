# Atlas Hub - Elasticsearch Resources - Security Groups

resource "aws_security_group" "default" {
  name = "elasticsearch.${var.zone}"
  description = "Security group for Elasticsearch instances in the Atlas Hub."

  vpc_id = "${var.vpc_id}"

  # ssh internal
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [
      "${var.hub_cidr_block}",
      "${var.lahq_cidr_block}"
    ]
  }

  # http transport
  ingress {
    protocol = "tcp"
    from_port = 9200
    to_port = 9200
    cidr_blocks = ["${var.layer_data_cidr_blocks}"]
  }

  # node transport
  ingress {
    protocol = "tcp"
    from_port = 9300
    to_port = 9300
    cidr_blocks = ["${var.layer_data_cidr_blocks}"]
  }

  # egress to anywhere
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "elasticsearch.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer = "data"
    atlas_project = "elasticsearch"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "elb" {
  name = "elasticsearch-elb.${var.zone}"
  description = "Security group for the Elasticsearch load balancer in the Atlas Hub."

  vpc_id = "${var.vpc_id}"

  # http transport
  ingress {
    protocol = "tcp"
    from_port = 9200
    to_port = 9200
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_services_cidr_blocks
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
      var.layer_services_cidr_blocks
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
    Name = "elasticsearch-elb.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer = "data"
    atlas_project = "elasticsearch"
    atlas_owner = "isre"
  }
}
