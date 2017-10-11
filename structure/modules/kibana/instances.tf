# Atlas Kibana Module - Instances

data "template_file" "cloudinit" {
  count = "${var.ec2_instance_count}"

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    # if only one instance, do "${name}.${zone}"
    fqdn = "${var.name}-kibana-${count.index + 1}.${data.terraform_remote_state.environment.zone}"
    role_package = "${var.role_package}"
    # this is the dns name of the es cluster
    elasticsearch_host = "${var.name}.${data.terraform_remote_state.environment.zone}"
  }
}

resource "aws_instance" "default" {
  count = "${var.ec2_instance_count}"

  ami                  = "${var.aws_ami}"
  instance_type        = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.name}"
  subnet_id            = "${data.terraform_remote_state.environment.layer_services_subnet_ids[
    count.index % length(data.terraform_remote_state.environment.layer_services_subnet_ids)
  ]}"
  key_name             = "${var.ec2_key_name}"

  user_data = "${element(data.template_file.cloudinit.*.rendered, count.index)}"

  vpc_security_group_ids = ["${concat(list(aws_security_group.default.id), var.additional_instance_sg_ids)}"]

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  tags {
    # if only one instance, do "${name}.${zone}"
    Name = "atlas-${var.name}-kibana-${count.index + 1}.${data.terraform_remote_state.environment.zone}"

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
