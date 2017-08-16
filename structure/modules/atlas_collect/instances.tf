# Atlas Collect Module - Instances

data "template_file" "cloudinit" {
  count = 3

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn = "collect-${count.index + 1}.${var.zone}"

    # feed in forwarding destination
    logs_destination    = "${var.logs_destination}"
    metrics_destination = "${var.metrics_destination}"
  }
}

resource "aws_instance" "collect" {
  count = 3

  key_name             = "${var.ec2_key_name}"
  ami                  = "${var.ami_id}"
  instance_type        = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.name}"
  subnet_id            = "${var.layer_admin_subnet_ids[count.index]}"

  user_data = "${element(data.template_file.cloudinit.*.rendered, count.index)}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  tags {
    Name = "collect-${count.index + 1}.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.stack_name}"
    atlas_layer       = "admin"
    atlas_project     = "collect"
    atlas_owner       = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
