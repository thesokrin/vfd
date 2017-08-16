# Codis Proxy Module - EC2 Resources

data "template_file" "cloudinit" {
  count = "${var.instance_count}"

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn         = "${var.name}-${count.index + 1}"
    role_package = "${var.role_package}"
    upstream     = "${var.redis_upstream}"
  }
}

resource "aws_instance" "default" {
  count = "${var.instance_count}"

  ami                  = "${var.ami_id}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.name}"
  subnet_id            = "${element(data.terraform_remote_state.atlas.layer_data_subnet_ids,
    count.index % var.instance_count)}"
  key_name             = "${var.ec2_keypair_name}"
  # it is crucial that we have stats out of these instances
  monitoring           = true

  user_data = "${element(data.template_file.cloudinit.*.rendered, count.index)}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  tags {
    Name = "${var.name}-${count.index + 1}.${data.terraform_remote_state.atlas.zone}"

    # atlas variables
    atlas_zone        = "${data.terraform_remote_state.atlas.zone}"
    atlas_environment = "${data.terraform_remote_state.atlas.env_name}"
    atlas_layer       = "data"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
