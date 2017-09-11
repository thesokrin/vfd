# Atlas Tier 1 IAM Resources - Outputs

output "aws_account_id" {
  value = "${data.aws_caller_identity.current.account_id}"
}

output "aws_account_name" {
  # get the account name by looking it up with the current account id
  value = "${var.aws_accounts[data.aws_caller_identity.current.account_id]}"
}

output "service_assume_roles" {
  value = {
    "ec2" = "${aws_iam_role.ec2_assume_role.name}",
    "redshift" = "${aws_iam_role.redshift_assume_role.name}"
  }
}
