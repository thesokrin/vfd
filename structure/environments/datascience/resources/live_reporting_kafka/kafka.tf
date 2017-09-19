# Atlas Data-Science Environment - Live Reporting With Kafka Resources - Kafka

module "kafka" {
  source = "../../../../modules/kafka"

  # inputs
  name                       = "${var.name}"
  aws_region                 = "${var.aws_region}"
  env_name                   = "${var.env_name}"
  project_name               = "${var.project_name}"
  role_package               = "${var.kafka_role_package}"
  ec2_instance_count         = "${var.kafka_instance_count}"
  ec2_instance_type          = "${var.kafka_instance_type}"

  additional_kafka_cidr_blocks   = "${var.additional_kafka_cidr_blocks}"
  additional_manager_cidr_blocks = "${var.additional_manager_cidr_blocks}"
}
