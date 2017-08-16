# Atlas Redis Cluster Shard Module - EC2 Resources

# primary resources
data "template_file" "primary_cloudinit" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    # example: redis-1.stg.grindr.io
    fqdn         = "${var.name}-${var.shard_id}.${var.zone}"
    role_package = "${var.role_package}"
    cluster_name = "${var.name}.${var.zone}"
    redis_role   = "primary"
  }
}

resource "aws_instance" "primary" {
  ami                  = "${var.ami_id}"
  instance_type        = "${var.primary_instance_type}"
  iam_instance_profile = "${var.iam_instance_profile}"
  subnet_id            = "${var.primary_subnet_id}"
  key_name             = "${var.ec2_key_name}"

  user_data = "${data.template_file.primary_cloudinit.rendered}"

  vpc_security_group_ids = ["${var.security_group_ids}"]

  root_block_device {
    volume_type = "${var.primary_root_volume_type}"
    volume_size = "${var.primary_root_volume_size}"
  }

  tags {
    # example: redis-1.stg.grindr.io
    Name = "${var.name}-${var.shard_id}.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
    atlas_role        = "primary"
  }

  lifecycle {
    create_before_destroy = true
  }
}


# replica resources
data "template_file" "replica_cloudinit" {
  count = "${var.replica_count}"

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    # example: redis-1-r1.stg.grindr.io
    fqdn         = "${var.name}-${var.shard_id}-r${count.index + 1}.${var.zone}"
    role_package = "${var.role_package}"
    cluster_name = "${var.name}.${var.zone}"
    redis_role   = "replica"
  }
}

resource "aws_instance" "replica" {
  count = "${var.replica_count}"

  ami                  = "${var.ami_id}"
  instance_type        = "${var.replica_instance_type}"
  iam_instance_profile = "${var.iam_instance_profile}"
  subnet_id            = "${var.replica_subnet_ids[count.index % length(var.replica_subnet_ids)]}"
  key_name             = "${var.ec2_key_name}"

  user_data = "${element(data.template_file.replica_cloudinit.*.rendered, count.index)}"

  vpc_security_group_ids = ["${var.security_group_ids}"]

  root_block_device {
    volume_type = "${var.replica_root_volume_type}"
    volume_size = "${var.replica_root_volume_size}"
  }

  tags {
    # example: redis-1-r1.stg.grindr.io
    Name = "${var.name}-${var.shard_id}-r${count.index + 1}.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "data"
    atlas_project     = "${var.project_name}"
    atlas_owner       = "${var.project_owner}"
    atlas_role        = "replica"
  }

  lifecycle {
    create_before_destroy = true
  }
}
