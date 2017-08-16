# Codis Proxy Module - Security Group Resources

resource "aws_security_group" "default" {
  name        = "${var.name}.${data.terraform_remote_state.atlas.zone}"
  description = "Security group for ${var.name} instances in the ${data.terraform_remote_state.atlas.env_name_fancy}."
  vpc_id      = "${data.terraform_remote_state.atlas.vpc_id}"

  # ssh internal
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["${data.terraform_remote_state.atlas.cidr_block}"]
  }

  # ingress in from data, services, and admin to 6379 port
  ingress {
    protocol  = "tcp"
    from_port = 6379
    to_port   = 6379

    cidr_blocks = ["${concat(
      data.terraform_remote_state.atlas.layer_admin_cidr_blocks,
      data.terraform_remote_state.atlas.layer_data_cidr_blocks,
      data.terraform_remote_state.atlas.layer_services_cidr_blocks,
      var.additional_cidr_blocks,
    )}"]
  }

  # codis intercommunication
  ingress {
    protocol  = "tcp"
    from_port = 9090
    to_port   = 9090
    self      = true
  }

  ingress {
    protocol  = "tcp"
    from_port = 11080
    to_port   = 11080
    self      = true
  }

  ingress {
    protocol  = "tcp"
    from_port = 18080
    to_port   = 18080
    self      = true
  }

  # egress anywhere
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}.${data.terraform_remote_state.atlas.zone}"

    # atlas variables
    atlas_zone        = "${data.terraform_remote_state.atlas.zone}"
    atlas_environment = "${data.terraform_remote_state.atlas.env_name}"
    atlas_layer       = "data"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }
}
