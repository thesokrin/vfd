# Atlas Development Environment - Mesos Services Workers - IAM Resources

resource "aws_iam_instance_profile" "default" {
  name = "atlas_dev_mesos_services_workers_profile"
  roles = [
    "${var.mesos_worker_role}"
  ]
}
