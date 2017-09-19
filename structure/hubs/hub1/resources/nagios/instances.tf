# Atlas Hub - Nagios Resources - Instances

data "template_file" "cloudinit" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn = "nagios.${var.zone}"
    zone = "${var.zone}"
  }
}

resource "aws_instance" "default" {
  ami = "${var.ec2_ami_id}"
  instance_type = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.name}"
  subnet_id = "${var.layer_admin_subnet_ids[0]}"
  key_name = "${var.ec2_key_name}"

  user_data = "${data.template_file.cloudinit.rendered}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  tags {
    Name = "nagios.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "admin"
    atlas_project = "nagios"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
