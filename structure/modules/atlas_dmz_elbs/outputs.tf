# Atlas DMZ Load Balancers Module - Outputs

output "realtime_elb_id" {
  value = "${aws_elb.realtime.id}"
}

output "web_elb_id" {
  value = "${aws_elb.web.id}"
}
