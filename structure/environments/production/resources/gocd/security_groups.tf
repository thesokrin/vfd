# Atlas Production - GoCD Resources - Security Groups

resource "aws_security_group" "gocd_server" {
  name        = "${var.gocd_server_name}.${data.terraform_remote_state.environment.zone}"
  description = "Security group for Static Services (${var.gocd_server_name}) instances in the ${data.terraform_remote_state.environment.env_name_fancy}."
  vpc_id      = "${data.terraform_remote_state.environment.vpc_id}"

  # ssh
  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22

    cidr_blocks = ["${distinct(concat(
      list(data.terraform_remote_state.environment.cidr_block),
      list(data.terraform_remote_state.hub.cidr_block),
      list(data.terraform_remote_state.hub.vpn_cidr_block),
    ))}"]
  }

  # worker port
  ingress {
    protocol  = "tcp"
    from_port = "${var.gocd_server_agent_port}"
    to_port   = "${var.gocd_server_agent_port}"

    cidr_blocks = ["${distinct(concat(
      data.terraform_remote_state.environment.layer_public_cidr_blocks,
      data.terraform_remote_state.environment.layer_services_cidr_blocks,
      data.terraform_remote_state.environment.layer_admin_cidr_blocks,
      data.terraform_remote_state.hub.layer_admin_cidr_blocks,
    ))}"]
  }

  # http port
  ingress {
    protocol  = "tcp"
    from_port = "80"
    to_port   = "80"

    cidr_blocks = ["${distinct(concat(
      data.terraform_remote_state.environment.layer_public_cidr_blocks,
      data.terraform_remote_state.environment.layer_services_cidr_blocks,
      data.terraform_remote_state.environment.layer_admin_cidr_blocks,
      data.terraform_remote_state.hub.layer_admin_cidr_blocks,
    ))}"]
  }

  # egress anywhere
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.gocd_server_name}.${data.terraform_remote_state.environment.zone}"

    # atlas variables
    atlas_zone        = "${data.terraform_remote_state.environment.zone}"
    atlas_environment = "${data.terraform_remote_state.environment.env_name}"
    atlas_layer       = "services"
    atlas_project     = "${var.project_name}"
    project_owner     = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
