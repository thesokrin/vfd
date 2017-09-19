# Atlas Production - GoCD Resources - Instances

data "template_file" "gocd_server_cloudinit" {
  template = "${file("${path.module}/templates/cloud-init/gocd-server-cloud-init.yml.tpl")}"

  vars {
    # if only one instance, do "${name}.${zone}"
    fqdn = "${var.gocd_server_name}.${data.terraform_remote_state.environment.zone}"
    role_package = "${var.gocd_server_role_package}"
  }
}

resource "aws_instance" "gocd_server" {
  ami                  = "${var.gocd_server_ami_id}"
  instance_type        = "${var.gocd_server_ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.gocd_server.name}"
  subnet_id            = "${data.terraform_remote_state.environment.layer_services_subnet_ids[0]}"
  key_name             = "${var.gocd_server_ec2_key_name}"

  user_data = "${data.template_file.gocd_server_cloudinit.rendered}"

  vpc_security_group_ids = ["${list(aws_security_group.gocd_server.id)}"]

  root_block_device {
    volume_type = "${var.gocd_server_ebs_root_volume_type}"
    volume_size = "${var.gocd_server_ebs_root_volume_size}"
  }

  tags {
    # if only one instance, do "${name}.${zone}"
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
