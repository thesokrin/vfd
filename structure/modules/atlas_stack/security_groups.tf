# Atlas Stack - Security Group Resources

resource "aws_security_group" "efs" {
  name = "efs-admin@${var.zone}"
  description = "Security group for EFS/NFS mounts in the admin layer in ${var.zone}"
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    protocol = "tcp"
    from_port = 2049
    to_port = 2049
    cidr_blocks = ["${aws_vpc.vpc.cidr_block}"]
  }

  ingress {
    protocol = "udp"
    from_port = 2049
    to_port = 2049
    cidr_blocks = ["${aws_vpc.vpc.cidr_block}"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "efs-admin@${var.zone}"
    atlas_environment = "${var.name}"
    atlas_zone        = "${var.zone}"
    atlas_layer       = "admin"
  }
}

resource "aws_security_group" "ssh" {
  name = "atlas_${var.name_short}_ssh_internal"
  description = "Security group for the ${var.name_fancy} which allows internal SSH access."
  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${aws_vpc.vpc.cidr_block}"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "atlas_${var.name_short}_ssh_internal"
    # atlas variables
    atlas_environment = "${var.name}"
    atlas_zone        = "${var.zone}"
  }
}
