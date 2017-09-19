# Atlas Development Environment - Load Balancing Resources - Outputs

output "artemis_realtime_dns" {
  value = "${aws_route53_record.artemis_realtime.fqdn}"
}

output "artemis_realtime_elb_id" {
  value = "${aws_elb.artemis_realtime.id}"
}

output "artemis_web_dns" {
  value = "${aws_route53_record.artemis_web.fqdn}"
}

output "artemis_web_elb_id" {
  value = "${aws_elb.artemis_web.id}"
}

output "aws_account_id" {
  value = "${var.aws_account_id}"
}

output "chat_sieve_elb_ids" {
  value = ["${aws_elb.chat_sieve.*.id}"]
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
