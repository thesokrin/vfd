# Atlas Kibana Resources - Security Group Resources

resource "aws_security_group" "default" {
  name        = "${var.name}-kibana.${data.terraform_remote_state.environment.zone}"
  description = "Security group for Kibana instances."
  vpc_id      = "${data.terraform_remote_state.environment.vpc_id}"

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [
      "${data.terraform_remote_state.environment.cidr_block}",
    ]
  }

  # to Kibana port 80
  ingress {
    protocol = "tcp"
    from_port = 5601
    to_port = 5601
    cidr_blocks = [
      "${data.terraform_remote_state.environment.layer_services_cidr_blocks}"
    ]
  }

  # egress to anywhere is allowed
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "${var.name}-kibana.${data.terraform_remote_state.environment.zone}"
    # atlas variables
    atlas_zone = "${data.terraform_remote_state.environment.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "services"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }
}

resource "aws_security_group" "kibana_elb" {
  name = "${var.name}-kibana-elb.${data.terraform_remote_state.environment.zone}"
  description = "Security group for the Kibana internal load balancer in the Atlas Hub."

  vpc_id      = "${data.terraform_remote_state.environment.vpc_id}"

  # to Kibana port 80
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 5601
    cidr_blocks = ["${concat(
      data.terraform_remote_state.environment.layer_admin_cidr_blocks,
      data.terraform_remote_state.environment.layer_services_cidr_blocks,
      data.terraform_remote_state.environment.layer_public_cidr_blocks,
      var.additional_cidr_blocks
    )}"]
  }

  # egress to anywhere is allowed
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "${var.name}-kibana.${data.terraform_remote_state.environment.zone}"
    # atlas variables
    atlas_zone = "${data.terraform_remote_state.environment.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "services"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }
}
