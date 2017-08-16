# Atlas RabbitMQ Module - Instances

data "template_file" "cloudinit" {
  count = "${var.instance_count}"

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn = "rabbitmq-${count.index + 1}.${var.zone}"
    package_role = "${var.package_role}"
  }
}

resource "aws_instance" "rabbitmq" {
  count = "${var.instance_count}"

  key_name = "${var.ec2_key_name}"
  ami = "${var.ami_id}"
  instance_type = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.name}"
  subnet_id = "${var.layer_data_subnet_ids[count.index % length(var.layer_data_subnet_ids)]}"

  user_data = "${element(data.template_file.cloudinit.*.rendered, count.index)}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  tags {
    Name = "rabbitmq-${count.index + 1}.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "data"
    atlas_project = "${var.project_name}"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
