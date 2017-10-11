# Atlas Production Environment - Elasticsearch Cascade Resources - Outputs

output "exported_modules" {
  value = [
    "elasticsearch",
    "kibana"
  ]
}
