# Atlas Hub - Outputs for Individual Layers

# dmz
output "layer_dmz_cidr_blocks" {
  value = ["${module.stack.layer_dmz_cidr_blocks}"]
}

output "layer_dmz_subnet_ids" {
  value = ["${module.stack.layer_dmz_subnet_ids}"]
}

# admin
output "layer_admin_cidr_blocks" {
  value = ["${module.stack.layer_admin_cidr_blocks}"]
}

output "layer_admin_subnet_ids" {
  value = ["${module.stack.layer_admin_subnet_ids}"]
}

# public
output "layer_public_cidr_blocks" {
  value = ["${module.stack.layer_public_cidr_blocks}"]
}

output "layer_public_subnet_ids" {
  value = ["${module.stack.layer_public_subnet_ids}"]
}

# services
output "layer_services_cidr_blocks" {
  value = ["${module.stack.layer_services_cidr_blocks}"]
}

output "layer_services_subnet_ids" {
  value = ["${module.stack.layer_services_subnet_ids}"]
}

# data
output "layer_data_cidr_blocks" {
  value = ["${module.stack.layer_data_cidr_blocks}"]
}

output "layer_data_subnet_ids" {
  value = ["${module.stack.layer_data_subnet_ids}"]
}

# net
output "layer_net_cidr_blocks" {
  value = ["${module.stack.layer_net_cidr_blocks}"]
}

output "layer_net_subnet_ids" {
  value = ["${module.stack.layer_net_subnet_ids}"]
}
