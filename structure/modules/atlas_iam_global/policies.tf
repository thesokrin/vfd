# Atlas IAM Global Module - Policies

data "template_file" "godlike_policy" {
  template = "${file("${path.module}/templates/policies/atlas-godlike-policy.json.tpl")}"
}

resource "aws_iam_policy" "godlike" {
  name = "atlas_godlike"
  description = "Unholy, inhuman, godlike powers."
  policy = "${data.template_file.godlike_policy.rendered}"
}

# read only iam policy
data "template_file" "limited_read_only_policy" {
  template = "${file("${path.module}/templates/policies/atlas-limited-read-only-policy.json.tpl")}"
}

resource "aws_iam_policy" "limited_read_only" {
  name = "atlas_limited_read_only"
  description = "Limited Read Only powers. This does not include access to PII items like S3"
  policy = "${data.template_file.limited_read_only_policy.rendered}"
}

# ansible iam policy
data "template_file" "ansible_policy" {
  template = "${file("${path.module}/templates/policies/atlas-ansible-policy.json.tpl")}"
}

resource "aws_iam_policy" "ansible" {
  name = "atlas_ansible"
  description = "Ansible's policy for accessing particular aws functionality"
  policy = "${data.template_file.ansible_policy.rendered}"
}

# general self access
data "template_file" "manage_self" {
  template = "${file("${path.module}/templates/policies/atlas-manage-self-policy.json.tpl")}"
  vars {
    aws_account_id = "${data.aws_caller_identity.current.account_id}"
  }
}

resource "aws_iam_policy" "manage_self" {
  name = "atlas_manage_self"
  description = "Policy to allow a user to manage themself ex. reset password, create access keys"
  policy = "${data.template_file.manage_self.rendered}"
}
