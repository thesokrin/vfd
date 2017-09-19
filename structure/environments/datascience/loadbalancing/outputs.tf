# Atlas Data-Science Environment - Public Load-Balancing Resources - Outputs

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "dash_elb_id" {
  value = "${aws_elb.dash.id}"
}

output "exported_modules" {
  value = []
}

output "web_elb_id" {
  value = "${aws_elb.web.id}"
}
