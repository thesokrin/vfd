# Atlas Manager Module - EC2

data "template_file" "cloudinit" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn = "manager.${var.zone}"
    zone = "${var.zone}"
  }
}

resource "aws_instance" "manager" {

  key_name               = "${var.ec2_key_name}"
  ami                    = "${var.ami_id}"
  instance_type          = "${var.ec2_instance_type}"
  iam_instance_profile   = "${aws_iam_instance_profile.default.name}"
  subnet_id              = "${var.layer_dmz_subnet_ids[0]}"

  user_data              = "${data.template_file.cloudinit.rendered}"

  vpc_security_group_ids = ["${aws_security_group.manager.id}"]

  private_ip = "${cidrhost(var.layer_dmz_cidr_blocks[0], 10)}"

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  tags {
    Name              = "manager.${var.zone}"
    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.stack_name}"
    atlas_layer       = "dmz"
    atlas_project     = "manager"
    atlas_owner       = "isre"
  }
}

# elastic public ip address for the manager instance
resource "aws_eip" "manager" {
  vpc = true
}

resource "aws_eip_association" "manager" {
  allocation_id = "${aws_eip.manager.id}"
  instance_id = "${aws_instance.manager.id}"
}
