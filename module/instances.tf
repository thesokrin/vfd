# Atlas Kafka Module - EC2 Resources

data "template_file" "cloudinit" {
  count = "${var.ec2_instance_count}"

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn         = "${var.name}-${count.index + 1}.${data.terraform_remote_state.environment.zone}"
    role_package = "${var.role_package}"
  }
}

resource "aws_instance" "kafka" {
  count                = "${var.ec2_instance_count}"

  ami                  = "${var.ami_id}"
  instance_type        = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.name}"
  subnet_id            = "${data.terraform_remote_state.environment.layer_data_subnet_ids[count.index % length(data.terraform_remote_state.environment.layer_data_subnet_ids)]}"
  key_name             = "${var.ec2_keypair_name}"

  user_data = "${element(data.template_file.cloudinit.*.rendered, count.index)}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  tags {
    Name = "${var.name}-${count.index + 1}.${data.terraform_remote_state.environment.zone}"

    # atlas variables
    atlas_zone        = "${data.terraform_remote_state.environment.zone}"
    atlas_environment = "${data.terraform_remote_state.environment.env_name}"
    atlas_layer       = "data"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
    broker_id         = "${count.index + 1}"
  }

  lifecycle {
    create_before_destroy = true
  }


  ephemeral_block_device {
      device_name = "/dev/xvdb"
      virtual_name = "ephemeral0"
  }

  ephemeral_block_device {
      device_name = "/dev/xvdc"
      virtual_name = "ephemeral1"
  }

  ephemeral_block_device {
      device_name = "/dev/xvdba"
      virtual_name = "ephemeral2"
  }

  ephemeral_block_device {
      device_name = "/dev/xvdbb"
      virtual_name = "ephemeral3"
  }

  ephemeral_block_device {
      device_name = "/dev/xvdbc"
      virtual_name = "ephemeral4"
  }

  ephemeral_block_device {
      device_name = "/dev/xvdbd"
      virtual_name = "ephemeral5"
  }
}
