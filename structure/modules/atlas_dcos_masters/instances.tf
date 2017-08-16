# Atlas DC/OS Masters Module - Instances

data "template_file" "cloudinit" {
  count = 3

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    aws_region              = "${var.stack_region}"
    coreos_ami_id           = "${var.coreos_ami_id}"
    dcos_bootstrap_id       = "${var.dcos_bootstrap_id}"
    exhibitor_bucket_name   = "${aws_s3_bucket.exhibitor.id}"
    exhibitor_bucket_prefix = "/"
    fqdn                    = "dcos-master-${count.index + 1}.${var.zone}"
    internal_master_elb_dns = "dcos-master.${var.zone}"
    master_elb_dns          = "dcos-master.${var.zone}"
    mesos_cluster_name      = "${var.stack_name}"
    oauth_enabled           = "true"
    zone                    = "${var.zone}"
  }
}

resource "aws_instance" "default" {
  count = 3

  ami                    = "${var.coreos_ami_id}"
  ebs_optimized          = true
  iam_instance_profile   = "${aws_iam_instance_profile.default.name}"
  instance_type          = "${var.ec2_instance_type}"
  key_name               = "${var.ec2_key_name}"
  subnet_id              = "${var.layer_admin_subnet_ids[count.index]}"
  user_data              = "${element(data.template_file.cloudinit.*.rendered, count.index)}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  root_block_device {
    volume_size = "${var.ebs_root_volume_size}"
    volume_type = "${var.ebs_root_volume_type}"
  }

  ebs_block_device {
    # mounted as /dev/xvdb
    device_name = "/dev/sdb"
    volume_size = "${var.ebs_var_lib_volume_size}"
    volume_type = "${var.ebs_var_lib_volume_type}"
  }

  tags {
    Name = "dcos-master-${count.index + 1}.${var.zone}"

    # dcos variables
    role = "mesos-master"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.stack_name}"
    atlas_layer       = "admin"
    atlas_owner       = "isre"
    atlas_project     = "dcos_masters"
  }

  lifecycle {
    create_before_destroy = true
  }
}
