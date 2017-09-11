# Atlas Dev Environment - Docker Registry - Outputs

output "registry_elb_id" {
  value = "${aws_elb.default.name}"
}
