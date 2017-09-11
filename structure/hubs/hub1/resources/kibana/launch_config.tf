# Atlas Hub 1 - Kibana Resources - Launch Config

data "template_file" "cloudinit" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn = "kibana.${var.zone}"
  }
}

resource "aws_launch_configuration" "default" {
  name_prefix = "kibana.${var.zone}_"

  image_id             = "${var.aws_ami}"
  instance_type        = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.arn}"
  key_name             = "${var.ec2_key_name}"
  user_data            = "${data.template_file.cloudinit.rendered}"

  security_groups = ["${aws_security_group.default.id}"]

  lifecycle {
    create_before_destroy = true
  }
}
