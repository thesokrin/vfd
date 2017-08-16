# Chat Presence Module - Instances

data "template_file" "cloudinit" {
  count = 3

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn = "presence-${count.index + 1}.${var.zone}"
    zone = "${var.zone}"
  }
}

resource "aws_instance" "default" {
  count = 3

  ami = "${var.ec2_ami_id}"
  instance_type = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.name}"
  subnet_id = "${var.layer_services_subnet_ids[count.index % 3]}"
  key_name = "${var.ec2_key_name}"

  user_data = "${element(data.template_file.cloudinit.*.rendered, count.index)}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  ebs_optimized = true
  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  tags {
    Name = "presence-${count.index + 1}.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "services"
    atlas_project = "${var.project_name}"
    atlas_owner = "${var.project_owner}"
  }
}
