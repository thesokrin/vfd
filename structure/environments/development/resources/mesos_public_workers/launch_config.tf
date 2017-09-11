# Atlas Development Environment - Mesos Public Workers - Launch Config Resources

data "template_file" "cloud_init" {
  template = "${file("${path.module}/templates/cloud-init.yml.tpl")}"

  vars {
    aws_region = "${data.aws_region.current.name}"
    dcos_bootstrap_id = "${var.dcos_bootstrap_id}"
    mesos_cluster_name = "${var.env_name}"
    master_elb_dns = "mesos-master.${var.zone}"
    internal_master_elb_dns = "mesos-master.${var.zone}"
    exhibitor_bucket_name = "exhibitor.${var.zone}"
    exhibitor_bucket_prefix = "/"
    oauth_enabled = true
  }
}

resource "aws_launch_configuration" "default" {
  name_prefix = "mesos-public.${var.zone}_"

  image_id = "${var.coreos_ami_id}"
  instance_type = "${var.ec2_instance_type}"
  iam_instance_profile = "${aws_iam_instance_profile.default.arn}"
  key_name = "isre-shared"

  security_groups = ["${aws_security_group.default.id}"]

  user_data = "${data.template_file.cloud_init.rendered}"

  root_block_device {
    volume_type = "${var.ebs_root_volume_type}"
    volume_size = "${var.ebs_root_volume_size}"
  }

  ebs_block_device {
    device_name = "/dev/sdb" # mounted as /dev/xvdb
    volume_type = "${var.ebs_var_lib_volume_type}"
    volume_size = "${var.ebs_var_lib_volume_size}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
