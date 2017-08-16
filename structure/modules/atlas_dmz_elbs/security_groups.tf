 # Atlas DMZ Load Balancers Module - Security Groups

resource "aws_security_group" "web" {
  name = "web-elb.${var.zone}"
  description = "Security group for the Atlas Web ELB in the ${var.env_name_fancy}."
  vpc_id = "${var.vpc_id}"

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
    Name = "web-elb.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
    atlas_role = "web"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "realtime" {
  name = "realtime-elb.${var.zone}"
  description = "Security group for the Atlas Realtime ELB in the ${var.env_name_fancy}."
  vpc_id = "${var.vpc_id}"

  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "realtime-elb.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
    atlas_role = "realtime"
  }

  lifecycle {
    create_before_destroy = true
  }
}
