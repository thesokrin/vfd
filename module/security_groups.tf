# Atlas Kafka Module - Security Group Resources

resource "aws_security_group" "default" {
  name        = "${var.name}.${data.terraform_remote_state.environment.zone}"
  description = "Security group for ${var.name} instances in the ${data.terraform_remote_state.environment.env_name_fancy}."
  vpc_id      = "${data.terraform_remote_state.environment.vpc_id}"

  # ssh internal
  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [
      "${data.terraform_remote_state.environment.cidr_block}"
    ]
  }

  # Allow Kafka standard default port 9092 to instances in admin, data, and services
  ingress {
    protocol = "tcp"
    from_port = 9092
    to_port = 9092
    cidr_blocks = ["${concat(
       data.terraform_remote_state.environment.layer_admin_cidr_blocks,
       data.terraform_remote_state.environment.layer_data_cidr_blocks,
       data.terraform_remote_state.environment.layer_services_cidr_blocks,
       var.additional_kafka_cidr_blocks,
     )}"]
  }

  # allow JMX access only internally for Kafka Manager
  # port range is:
  #   from: jmx port
  #   to: jmx rmi port
  ingress {
    protocol = "tcp"
    from_port = 9093
    to_port   = 9094
    self      = true
  }

  # allow kafka manager internally and from specified security groups
  ingress {
    protocol        = "tcp"
    from_port       = 8080
    to_port         = 8080
    self            = true
    security_groups = [
      "${var.additional_manager_security_group_ids}"
    ]
    cidr_blocks     = [
      "${var.additional_manager_cidr_blocks}"
    ]
  }

  # egress to anywhere is allowed
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.name}.${data.terraform_remote_state.environment.zone}"
    # atlas variables
    atlas_zone = "${data.terraform_remote_state.environment.zone}"
    atlas_environment = "${data.terraform_remote_state.environment.env_name}"
    atlas_layer = "data"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
