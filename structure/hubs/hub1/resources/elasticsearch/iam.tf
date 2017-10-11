# Atlas Hub - Elasticsearch Resources - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_hub_elasticsearch_profile"
  roles = [
    "${aws_iam_role.default.name}"
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "default" {
  name = "atlas_hub_elasticsearch_role"
  assume_role_policy = "${file("${path.module}/../../../../resources/iam/policies/ec2_assume_role.json")}"
}

data "template_file" "elasticsearch_iam_policy" {
  template = "${file("${path.module}/policies/elasticsearch-policy.json.tpl")}"
}

resource "aws_iam_policy" "default" {
  name = "aws_hub_elasticsearch"
  description = "Elasticsearch Access Policy in the Atlas Hub."
  policy = "${data.template_file.elasticsearch_iam_policy.rendered}"
}

resource "aws_iam_policy_attachment" "default" {
  name = "${aws_iam_policy.default.name}_attachment"
  roles = ["${aws_iam_role.default.name}"]
  policy_arn = "${aws_iam_policy.default.arn}"
}
