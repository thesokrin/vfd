# Atlas stack - Network ACLs for the Data Layer
# FIXME ACLs operate at layer 2, therefore it is not currently possibly to implement the Atlas security model in ACLs
# ingress:
#   - deny from dmz
#   - allow from rest of stack
#   - deny from anywhere else
# egress:
#   - allow to rest of stack
#   - deny to anywhere else

# ingress
resource "aws_network_acl_rule" "data_l2_ingress_allow_default" {
  network_acl_id = "${module.data.network_acl_id}"
  # config
  egress = false
  rule_number = 100
  protocol = "all"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
}

# egress
resource "aws_network_acl_rule" "data_l2_egress_allow_default" {
  network_acl_id = "${module.data.network_acl_id}"
  # config
  egress = true
  rule_number = 100
  protocol = "all"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
}
