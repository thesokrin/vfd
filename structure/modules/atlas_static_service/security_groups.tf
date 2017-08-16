# Atlas Static Services Module - Security Groups

resource "aws_security_group" "default" {
  name        = "${var.name}.${data.terraform_remote_state.environment.zone}"
  description = "Security group for Static Services (${var.name}) instances in the ${data.terraform_remote_state.environment.env_name_fancy}."
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

  # service port
  ingress {
    protocol  = "${var.sg_instance_protocol}"
    from_port = "${var.sg_instance_from_port}"
    to_port   = "${var.sg_instance_to_port}"

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
    Name = "${var.name}.${data.terraform_remote_state.environment.zone}"

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

resource "aws_security_group" "loadbalancer" {
  count       = "${var.create_elb}"
  name        = "${var.name}-elb.${data.terraform_remote_state.environment.zone}"
  description = "Security group for the ${var.project_name} load balancer in the ${data.terraform_remote_state.environment.env_name}."
  vpc_id      = "${data.terraform_remote_state.environment.vpc_id}"

  # http
  ingress {
    protocol  = "${var.sg_elb_protocol}"
    from_port = "${var.service_port}"
    to_port   = "${var.service_port}"

    cidr_blocks = ["${concat(
      data.terraform_remote_state.environment.layer_public_cidr_blocks,
      data.terraform_remote_state.environment.layer_services_cidr_blocks,
      data.terraform_remote_state.environment.layer_admin_cidr_blocks,
      data.terraform_remote_state.hub.layer_admin_cidr_blocks,
    )}"]
  }

  egress {
    protocol    = "-1"
    from_port   = "0"
    to_port     = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}-elb.${data.terraform_remote_state.environment.zone}"

    # atlas variables
    atlas_zone        = "${data.terraform_remote_state.environment.zone}"
    atlas_environment = "${data.terraform_remote_state.environment.env_name}"
    atlas_layer       = "services"
    atlas_project     = "${var.project_name}"
    project_owner     = "${var.project_owner}"
  }
}
