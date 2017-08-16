# Atlas $_ENVIRONMENT Environment - $_DESCRIPTION - Instances

module "spot_services"{
  source = "../../../../modules/atlas_service"

 # inputs
  env_name                    = "${var.env_name}"
  env_name_short              = "${var.env_name_short}"
  env_name_fancy              = "${var.env_name_fancy}"
  name                        = "${var.ec2_name}"
  project_name                = "${var.ec2_project_name}"
  project_name_fancy          = "${var.ec2_project_name_fancy}"
  project_owner               = "${var.ec2_project_owner}"
  capacity                    = "${var.ec2_capacity}"
  ec2_instance_type           = "${var.ec2_instance_type}"
  cidr_block                  = "${var.ec2_cidr_block}"
  hub_cidr_block              = "${var.ec2_hub_cidr_block}"
  lahq_cidr_block             = "${var.ec2_lahq_cidr_block}"
  layer_admin_cidr_blocks     = "${var.ec2_layer_admin_cidr_blocks}"
  layer_public_cidr_blocks    = "${var.ec2_layer_public_cidr_blocks}"
  layer_services_cidr_blocks  = "${var.ec2_layer_services_cidr_blocks}"
  layer_services_subnet_ids   = "${var.ec2_layer_services_subnet_ids}"
  private_zone_id             = "${var.ec2_private_zone_id}"
  role_package                = "${var.ec2_role_package}"
  vpc_id                      = "${var.ec2_vpc_id}"
  zone                        = "${var.ec2_zone}"
  spot_price                  = "${var.ec2_spot_price}"

}
