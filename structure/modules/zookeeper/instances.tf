# Atlas Zookeeper Module - Instances

data "template_file" "cloudinit" {
  count = "${var.ec2_instance_count}"

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn                   = "${var.name}-${count.index + 1}.${var.zone}"
    role_package           = "${var.role_package}"
    bucket                 = "${aws_s3_bucket.exhibitor.bucket}"
    instance_count         = "${var.ec2_instance_count}"
    zookeeper_heap_percent = "${var.zookeeper_heap_percent}"
  }
}

resource "aws_instance" "zookeeper" {
  count = "${var.ec2_instance_count}"

  ami                  = "${var.ami_id}"
  instance_type        = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.name}"
  subnet_id            = "${var.layer_admin_subnet_ids[count.index % length(var.layer_admin_subnet_ids)]}"
  key_name             = "${var.ec2_key_name}"

  user_data = "${element(data.template_file.cloudinit.*.rendered, count.index)}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  ebs_block_device {
    device_name = "/dev/xvdb"
    volume_type = "${var.ebs_data_volume_type}"
    volume_size = "${var.ebs_data_volume_size}"
  }

  tags {
    Name = "${var.name}-${count.index + 1}.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "admin"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
