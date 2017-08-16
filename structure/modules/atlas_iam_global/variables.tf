# Atlas IAM Global Module

variable "aws_account_id" {
  description = <<-EOF
    The current AWS account ID. It is necessary to pass this as a variable due to Terraform count limitations.
  EOF
}

variable "aws_account_ids" {
  default = {
    "staging"  = "886703752586"
    "preprod"  = "202004573189"
    "prod-2.0" = "284224159432"
    "prod-3.0" = "058144102190"
  }
  description = <<-EOF
    A mapping of AWS account names to account IDs.
  EOF
}
