# Atlas Preprod Account - IAM Resources - Policies

data "template_file" "ami_builder" {
  template = "${file("${path.module}/policies/ami-builder-policy.json.tpl")}"
}

resource "aws_iam_policy" "ami_builder" {
  name = "atlas_ami_builder"
  description = "Allows actions required for building AMIs in Packer."
  policy = "${data.template_file.ami_builder.rendered}"
}
