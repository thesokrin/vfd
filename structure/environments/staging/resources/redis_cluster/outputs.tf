# Atlas Staging Environment - Redis Resources - Outputs

output "name" {
  value = "${var.name}"
}

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "env_name" {
  value = "${var.env_name}"
}

output "env_name_fancy" {
  value = "${var.env_name_fancy}"
}

output "env_name_short" {
  value = "${var.env_name_short}"
}

output "replica_count_per_primary" {
  value = "${var.replica_count_per_primary}"
}

output "exported_modules" {
  value = [
    "redis",
    "redis.cluster_dns",
    "redis.cluster_resources",
    "redis.shard_1",
    "redis.shard_2",
    "redis.shard_3",
  ]
}
