# Atlas RabbitMQ Module - Security Groups

resource "aws_security_group" "default" {
  name = "rabbitmq.${var.zone}"
  description = "Security group for rabbitmq instances in the ${var.env_name_fancy}."
  vpc_id = "${var.vpc_id}"

  # ssh inbound
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${var.cidr_block}"]
  }

  # rabbitmq ports inbound from services data and admin
  ingress {
    protocol  = "tcp"
    from_port = 5671
    to_port   = 5672
    cidr_blocks = ["${concat(
      var.layer_services_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_admin_cidr_blocks
    )}"]
  }

  # epmd allowed only within same security group
  ingress {
    protocol    = "tcp"
    from_port   = 4369
    to_port     = 4369
    self        = true
  }

  # cluster gossip allowed only within same security group
  ingress {
    protocol    = "tcp"
    from_port   = 35197
    to_port     = 35197
    self        = true
  }

  # egress anywhere
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name  = "rabbitmq.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "data"
    atlas_project = "${var.project_name}"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "rabbitmq_elb" {
  name = "rabbitmq-elb.${var.zone}"
  description = "Security group for the ${var.project_name} load balancer in the ${var.env_name}."
  vpc_id = "${var.vpc_id}"

  ingress {
    protocol = "tcp"
    from_port = 5672
    to_port = 5672
    cidr_blocks = ["${concat(
      var.layer_services_cidr_blocks,
      var.layer_data_cidr_blocks,
      var.layer_admin_cidr_blocks
    )}"]
  }

  egress {
    protocol = "-1"
    from_port = "0"
    to_port = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "rabbitmq-elb.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "data"
    atlas_project = "${var.project_name}"
    atlas_owner = "isre"
  }
}