# Atlas Elasticsearch Module - Launch Configuration Resources

data "template_file" "cloud_init" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn                     = "${var.name}.${var.zone}"
    role_package             = "${var.role_package}"
    elasticsearch_cluster_id = "${var.elasticsearch_cluster_id}"
    name                     = "${var.name}"
    size                     = "${var.asg_capacity}"
  }
}

resource "aws_launch_configuration" "default" {
  name_prefix = "${var.name}.${var.zone}_"

  image_id             = "${var.ami_id}"
  instance_type        = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.arn}"
  key_name             = "${var.ec2_keypair_name}"

  security_groups = ["${aws_security_group.default.id}"]

  user_data = "${data.template_file.cloud_init.rendered}"

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  lifecycle {
    create_before_destroy = true
  }

  # only support up to 2 drives
  ephemeral_block_device {
    device_name = "/dev/xvdb"
    virtual_name = "ephemeral0"
  }

  ephemeral_block_device {
    device_name = "/dev/xvdc"
    virtual_name = "ephemeral1"
  }
}
