# Atlas Development Environment - Mesos Masters EC2 Instances

data "template_file" "cloudinit" {
  count = 3

  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    id = "${count.index + 1}"
    aws_region = "${data.aws_region.current.name}"
    dcos_bootstrap_id = "${var.dcos_bootstrap_id}"
    mesos_cluster_name = "${var.env_name}"
    master_elb_dns = "mesos-master.${var.zone}"
    internal_master_elb_dns = "mesos-master.${var.zone}"
    exhibitor_bucket_name = "${aws_s3_bucket.exhibitor.id}"
    exhibitor_bucket_prefix = "/"
    oauth_enabled = "true"
  }
}

resource "aws_instance" "default" {
  count = 3

  ami = "${var.coreos_ami_id}"
  instance_type = "${var.ec2_instance_type}"
  key_name = "isre-shared"
  subnet_id = "${var.layer_admin_subnet_ids[count.index]}"

  iam_instance_profile = "${aws_iam_instance_profile.default.name}"

  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  user_data = "${element(data.template_file.cloudinit.*.rendered, count.index)}"

  ebs_optimized = true

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  ebs_block_device {
    device_name = "/dev/sdb" # mounted as /dev/xvdb
    volume_type = "${var.ebs_var_lib_volume_type}"
    volume_size = "${var.ebs_var_lib_volume_size}"
  }

  tags {
    Name = "mesos-master-${count.index + 1}.${var.zone}"
    # mesos variables
    role              = "mesos-master"
    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer       = "admin"
    atlas_project     = "mesos_masters"
    atlas_owner       = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
