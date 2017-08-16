# Atlas CDN Module - Variables

variable "env_name" {
  description = <<-EOF
    The long Atlas Environment name.
  EOF
}

variable "env_name_fancy" {
  description = <<-EOF
    The fancy Atlas Environment name.
  EOF
}

variable "env_name_short" {
  description = <<-EOF
    The short, slugified Atlas Environment name.
  EOF
}

variable "project_name" {
  default = "cdn"
  description = <<-EOF
    The Atlas Project name for these resources.
  EOF
}

variable "project_owner" {
  default = "isre"
  description = <<-EOF
    The team responsible for the billing of these resources.
  EOF
}

variable "public_zone_id" {
  description = <<-EOF
    The public hosted zone id for the given Atlas Environment.
  EOF
}

variable "website_aliases" {
  type = "map"
  default = {
    "dev.grindr.io"  = "www-dev.grindr.com"
    "stg.grindr.io"  = "www-stage.grindr.com"
    "prod.grindr.io" = "www.grindr.com"
  }
  description = <<-EOF
    A mapping of zone names to aliases for the website CDN endpoint.
  EOF
}

variable "wildcard_certificate_arn" {
  description = <<-EOF
    ARN of a certificate covering a wildcard domain list in the given zone.
  EOF
}

variable "zone" {
  description = <<-EOF
    The zone name of the given Atlas Environment.
  EOF
}
