# Atlas Artemis Module - Launch Configurations

data "template_file" "cloud_init" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn = "${var.name}.${var.zone}"
    role_package = "${var.role_package}"
  }
}

resource "aws_launch_configuration" "default" {
  name_prefix = "artemis.${var.zone}_"

  key_name = "${var.ec2_keypair_name}"

  image_id = "${var.ec2_ami_id}"
  instance_type = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.arn}"

  security_groups = ["${aws_security_group.default.id}"]

  user_data = "${data.template_file.cloud_init.rendered}"

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
