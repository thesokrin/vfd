# Atlas Hub

## Peering Connections and Routes

> **NOTE:** Do not touch this Atlas Project! You've been warned!

For each Atlas Environment connected to this Atlas Hub, a VPC peering connection is created. Often, this connection will
be across AWS accounts. Therefore, it is necessary to manage this resource in two locations, from the Atlas Environment
and from the Atlas Hub itself.

Atlas Environments are said to _own_ the VPC connection, as it is initiated from their end. Atlas Hubs will use
the `aws_vpc_peering_connection_accepter` resource to accept this VPC peering connection and then define internal routes
back over this connection from the Atlas Hub to the Atlas Environment.

Since VPC peering connections are almost always across AWS accounts in the case of Atlas Environment to Atlas Hub
peering, after running Terraform for the first time to create the peer connection, it is necessary to then accept the
connection from the Atlas Hub's AWS account, which is `prod-2.0`:

```
$ aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id $VPC_PEERING_CONNECTION_ID
```

> **NOTE:** Even after the VPC peering connection has been marked active, it may take additional time for it to propagate
> across accounts.

After accepting a new VPC connection, it is necessary to update the connection to allow the Atlas Hub to resolve
internal DNS names of Atlas Environments. This can be done with the AWS CLI fairly trivially:

```
$ aws ec2 modify-vpc-peering-connection-options --vpc-peering-connection-id $VPC_PEERING_CONNECTION_ID \
     --accepter-peering-connection-options AllowDnsResolutionFromRemoteVpc=true
{
   "AccepterPeeringConnectionOptions": {
       "AllowDnsResolutionFromRemoteVpc": true
   }
}
```

### A Word of Caution

Terraform has changed the way that VPC peering connections are handled in the past, so beware of future changes.
