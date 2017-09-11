# Atlas Development Environment - Mesos Public Workers - IAM Resources

resource "aws_iam_instance_profile" "default" {
  name = "atlas_dev_mesos_public_workers_profile"
  roles = [
    "${var.mesos_worker_role}"
  ]
}
