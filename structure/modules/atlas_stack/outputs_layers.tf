# Atlas Stack - Outputs for Individual Layers

# dmz
output "layer_dmz_cidr_blocks" {
  value = ["${module.dmz.cidr_blocks}"]
}

output "layer_dmz_subnet_ids" {
  value = ["${module.dmz.subnet_ids}"]
}

# admin
output "layer_admin_cidr_blocks" {
  value = ["${module.admin.cidr_blocks}"]
}

output "layer_admin_subnet_ids" {
  value = ["${module.admin.subnet_ids}"]
}

# public
output "layer_public_cidr_blocks" {
  value = ["${module.public.cidr_blocks}"]
}

output "layer_public_subnet_ids" {
  value = ["${module.public.subnet_ids}"]
}

# services
output "layer_services_cidr_blocks" {
  value = ["${module.services.cidr_blocks}"]
}

output "layer_services_subnet_ids" {
  value = ["${module.services.subnet_ids}"]
}

# data
output "layer_data_cidr_blocks" {
  value = ["${module.data.cidr_blocks}"]
}

output "layer_data_subnet_ids" {
  value = ["${module.data.subnet_ids}"]
}

# net
output "layer_net_cidr_blocks" {
  value = ["${module.net.cidr_blocks}"]
}

output "layer_net_subnet_ids" {
  value = ["${module.net.subnet_ids}"]
}
