# Atlas Development Environment - Tier 2 IAM Resources - Roles

resource "aws_iam_role" "mesos_worker" {
  name = "atlas_dev_mesos_worker_role"
  assume_role_policy = "${file("${path.module}/../../../resources/iam/policies/ec2_assume_role.json")}"
}
