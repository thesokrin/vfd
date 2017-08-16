# Atlas VPN - Outputs

output "vpn_cidr_block" {
  value = "${var.vpn_cidr_block}"
}

output "vpn_gateway_id" {
  value ="${aws_vpn_gateway.vpn_gateway.id}"
}
