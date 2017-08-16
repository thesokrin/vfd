# Atlas Stack - Network ACLs for the DMZ Layer
# In summary, the DMZ allows ingress from anywhere and egress to anywhere.

# ingress rules
resource "aws_network_acl_rule" "dmz_l2_ingress_default" {
  network_acl_id = "${module.dmz.network_acl_id}"
  # config
  egress = false
  rule_number = 100
  protocol = "all"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
}

# egress rules
resource "aws_network_acl_rule" "dmz_l2_egress_default" {
  network_acl_id = "${module.dmz.network_acl_id}"
  # config
  egress = true
  rule_number = 100
  protocol = "all"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
}
