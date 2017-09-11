# Atlas Tier 1 IAM Resources - Variables

variable "aws_accounts" {
  type = "map"
  description = <<-EOF
    A map of AWS account ids to friendly names.
  EOF
}
