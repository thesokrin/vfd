# Atlas Stack - Input Variables

variable "id" {
  description = <<-EOF
    An integer from 1 to 254 describing the unique ID of this Atlas Stack.
  EOF
}

variable "name" {
  description = <<-EOF
    The name for this Atlas Stack.
  EOF
}

variable "name_short" {
  description = <<-EOF
    The short, three to four character name for this Atlas Stack.
  EOF
}

variable "name_fancy" {
  description = <<-EOF
    The fancy name for this Atlas Stack.

    This should have a value like "Atlas Data-Science Environment" or "Atlas Hub".
  EOF
}

variable "zone" {
  description = <<-EOF
    The DNS hosted zone for this Atlas Stack.

    For hubs, this will typically be ${region}.grindr.io; for environments this will typically be
    ${environment_name_short}.${region}.grindr.io.
  EOF
}
