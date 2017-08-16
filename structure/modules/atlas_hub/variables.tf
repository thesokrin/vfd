# Atlas Hub - Variables

variable "id" {
  description = <<-EOF
    An integer from 1 to 254 describing the unique ID of this Atlas Hub.

    Internally used as the second octet when allocating the /16 for the VPC.
  EOF
}

variable "name" {
  description = <<-EOF
    The name for this Atlas Hub.

    For the first Atlas Hub, this should be "hub", for subsequent Atlas Hubs, should the need actually arise, this
    should be "hub1", etc.
  EOF
}

variable "name_fancy" {
  description = <<-EOF
    The fancy name of this Atlas Hub.

    For the first Atlas Hub, this should be "Atlas Hub", for subsequent Atlas Hubs, should the need actually arise,
    this should be set to "Atlas Hub 1", etc.
  EOF
}

variable "name_short" {
  description = <<-EOF
    The short name of this Atlas Hub.

    This should generally have the same value as name above.
  EOF
}
