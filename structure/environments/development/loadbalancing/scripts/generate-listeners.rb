#!/usr/bin/env ruby

# Ruby script to generate 100 Terraform aws_elb listener blocks for each of the port forwardings
# It's horrible, but it does the needful.

puts <<-EOF
  # start listener definitions
EOF

(0..99).each do |x|
  puts <<-EOF
  listener {
    lb_protocol = "SSL"
    lb_port = "${format("%d", 40000 + (count.index * 100) + #{x})}"
    instance_protocol = "TCP"
    instance_port = "${format("%d", 40000 + (count.index * 100) + #{x})}"
    ssl_certificate_id = "${var.wildcard_certificate_arn}"
  }
  EOF
end

puts <<-EOF
  # end of listener definitions
EOF
