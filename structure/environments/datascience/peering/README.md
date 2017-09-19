# Atlas Data-Science Environment

## VPC Peering Resources

This Atlas Project is concerned with VPC peering resources as they relate to the Atlas Data-Science Environment.

For now, since both the Atlas Production Environment and the Atlas Data-Science Environment live in the same AWS
account, this project only manages route injection for the VPC peering connection defined in the
`environments/production/peering` Atlas Project. This is contrary to the way things are done elsewhere for cross-account
hub peering. The Atlas Production Environment is considered to _own_ the VPC peering connection in question, so its
VPC peering resources' state is tied to that of the Atlas Production Environment, not the Atlas Data-Science
Environment.
