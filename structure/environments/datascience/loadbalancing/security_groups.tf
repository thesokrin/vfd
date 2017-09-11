# Atlas Data-Science Environment - Public Load-Balancing Resources - Security Groups

resource "aws_security_group" "dash_elb" {
  name        = "dash.${var.zone}"
  description = "Security group for the Dashboard Load Balancer in the ${var.env_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "dash.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "dmz"
    atlas_project     = "loadbalancing"
    atlas_owner       = "isre"
  }
}

resource "aws_security_group" "web_elb" {
  name        = "web.${var.zone}"
  description = "Security group for the Web Load Balancer in the ${var.env_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "web.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "dmz"
    atlas_project     = "loadbalancing"
    atlas_owner       = "isre"
  }
}
