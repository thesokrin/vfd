# Atlas Development Environment - Load Balancing Resources - Security Groups

resource "aws_security_group" "artemis_web_elb" {
  name = "artemis-web-elb.${var.zone}"
  description = "Security group for the Artemis Web ELB in the ${var.env_name_fancy}."
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
    Name = "artemis-web.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "loadbalancing"
    atlas_owner = "isre"
    atlas_role = "artemis_web"
  }
}

resource "aws_security_group" "chat_sieve_elb" {
  name = "chatsieve.${var.zone}"
  description = "Security group for the Chat Sieve Load Balancers in the Atlas Dev Environment."
  vpc_id = "${var.vpc_id}"

  ingress {
    protocol = "tcp"
    from_port = 40000
    to_port = 40099
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "chatsieve.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "loadbalancing"
    atlas_owner = "isre"
  }
}

resource "aws_security_group" "dash_elb" {
  name = "dash.${var.zone}"
  description = "Security group for the Dashboard Load Balancer in the Atlas Dev Environment."
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
    Name = "dash.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "loadbalancing"
    atlas_owner = "isre"
  }
}

resource "aws_security_group" "artemis_realtime_elb" {
  name = "artemis-realtime-elb.${var.zone}"
  description = "Security group for the Artemis Real-time ELB in the ${var.env_name_fancy}."
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
    Name = "artemis-realtime.${var.zone}"
    # atlas tags
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "loadbalancing"
    atlas_owner = "isre"
    atlas_role = "artemis_realtime"
  }
}

resource "aws_security_group" "web_elb" {
  name = "web.${var.zone}"
  description = "Security group for the Web/Wildcard Load Balancer in the Atlas Dev Environment."
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
    Name = "web.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "dmz"
    atlas_project = "loadbalancing"
    atlas_owner = "isre"
  }
}
