# Atlas Development Environment - Tier 2 IAM Resources - Policies

data "template_file" "mesos_worker_policy" {
  template = "${file("${path.module}/policies/mesos-worker-policy.json.tpl")}"

  vars {
    registry_bucket_name = "${var.s3_registry_bucket_name}"
  }
}

resource "aws_iam_policy" "mesos_worker" {
  name = "atlas_dev_mesos_worker"
  description = "Mesos Workers Access Policy in the Atlas Dev Environment"
  policy = "${data.template_file.mesos_worker_policy.rendered}"
}

resource "aws_iam_policy_attachment" "mesos_worker" {
  name = "${aws_iam_policy.mesos_worker.name}_attachment"
  roles = ["${aws_iam_role.mesos_worker.name}"]
  policy_arn = "${aws_iam_policy.mesos_worker.arn}"
}
