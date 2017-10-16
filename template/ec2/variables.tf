variable "vpc" {
 description = <<-EOF
   VPC ID where this will go.
 EOF
}

 variable "subnet" {
   description = <<-EOF
     Subnet to use.
   EOF
 }

 variable "cidr" {
   type        = "list"
   description = <<-EOF
     CIDR to allow in SG.
   EOF
}
