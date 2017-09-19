# Atlas Hub 1 - Redis Resources - EC2 Instances

data "template_file" "cloudinit_master" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn = "redis-master.${var.zone}"
    zone = "${var.zone}"
  }
}

data "template_file" "cloudinit_slave" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    fqdn = "redis-slave.${var.zone}"
    zone = "${var.zone}"
  }
}

resource "aws_instance" "master" {
  ami                    = "${var.aws_ami}"                           #  Ubuntu AMI
  instance_type          = "${var.ec2_instance_type}"
  subnet_id              = "${var.layer_data_subnet_ids[0]}"
  iam_instance_profile   = "${aws_iam_instance_profile.default.name}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  user_data = "${data.template_file.cloudinit_master.rendered}"

  tags {
    Name = "redis-master.${var.zone}"

    # atlas variable
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer       = "data"
    atlas_project     = "redis"
    atlas_role        = "redis_master"
    atlas_owner       = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "slave" {
  ami                    = "${var.aws_ami}"                           #  Ubuntu AMI
  instance_type          = "${var.ec2_instance_type}"
  subnet_id              = "${var.layer_data_subnet_ids[0]}"
  iam_instance_profile   = "${aws_iam_instance_profile.default.name}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  placement_group        = "${aws_placement_group.redis.id}"

  user_data = "${data.template_file.cloudinit_slave.rendered}"

  tags {
    Name = "redis-slave.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.hub_name}"
    atlas_layer       = "data"
    atlas_project     = "redis"
    atlas_role        = "redis_slave"
    atlas_owner       = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_placement_group" "redis" {
  name     = "atlas_hub_redis"
  strategy = "cluster"
}
