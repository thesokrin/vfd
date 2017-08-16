#  Atlas RabbitMQ Module - IAM

resource "aws_iam_instance_profile" "default" {
  name = "atlas_${var.env_name_short}_rabbitmq_profile"
  roles = [
    "${var.ec2_iam_role}"
  ]
}
