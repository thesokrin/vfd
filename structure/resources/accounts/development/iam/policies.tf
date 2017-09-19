# Atlas Preprod Account - IAM Resources - Policies

data "template_file" "ami_builder" {
  template = "${file("${path.module}/policies/ami-builder-policy.json.tpl")}"
}

resource "aws_iam_policy" "ami_builder" {
  name = "atlas_ami_builder"
  description = "Allows actions required for building AMIs in Packer."
  policy = "${data.template_file.ami_builder.rendered}"
}

# gocd policy
data "template_file" "gocd_development_deploy" {
  template = "${file("${path.module}/policies/gocd-development-deploy-user.json.tpl")}"
}

resource "aws_iam_policy" "gocd_development_deploy" {
  name = "atlas_gocd_development_deploy"
  description = "Policy to grant access to create ElasticBeanstalk application versions and deploy them."
  policy = "${data.template_file.gocd_development_deploy.rendered}"
}

