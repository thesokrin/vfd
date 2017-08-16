# Atlas Stack - SNS Resources

# autodns topic for automatic dns name generation
resource "aws_sns_topic" "autodns" {
  name = "atlas_${var.name_short}_autodns_topic"
  display_name = "Auto-DNS Topic for Auto-Scaling Instances in the ${var.name_fancy}."
}
