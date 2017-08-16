# Atlas DC/OS Public Workers Module - Launch Config

data "template_file" "cloud_init" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    aws_region              = "${var.stack_region}"
    dcos_bootstrap_id       = "${var.dcos_bootstrap_id}"
    dcos_cluster_name       = "${var.stack_name}"
    exhibitor_bucket_name   = "${aws_s3_bucket.exhibitor.id}"
    exhibitor_bucket_name   = "exhibitor.${var.zone}"
    exhibitor_bucket_prefix = "/"
    fqdn                    = "dcos-public.${var.zone}"
    internal_master_elb_dns = "dcos-master.${var.zone}"
    master_elb_dns          = "dcos-master.${var.zone}"
    oauth_enabled           = true
    zone                    = "${var.zone}"
  }
}

resource "aws_launch_configuration" "default" {
  name_prefix = "dcos-public.${var.zone}_"

  iam_instance_profile = "${aws_iam_instance_profile.default.arn}"
  image_id             = "${var.coreos_ami_id}"
  instance_type        = "${var.ec2_instance_type}"
  key_name             = "${var.ec2_key_name}"
  security_groups      = ["${aws_security_group.default.id}"]
  user_data            = "${data.template_file.cloud_init.rendered}"

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  ebs_block_device {
    # mounted as /dev/xvdb
    device_name = "/dev/sdb"
    volume_type = "${var.ebs_var_lib_volume_type}"
    volume_size = "${var.ebs_var_lib_volume_size}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
