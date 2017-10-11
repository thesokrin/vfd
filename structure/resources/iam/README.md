# Atlas Tier 1 IAM Resources

Please [read the docs][iam-policies] for an explanation of what the different tiers of IAM resources mean.

In short, IAM policies declared in Tier 1 (T1) here in this directory will be propagated across all Grindr AWS accounts.
If the policy, role, profile, group, and/or user that you are trying to create should not be propagated across accounts,
please do not define it here, rather push it down to Tier 2 or Tier 3 [as described in the documentation][iam-policies].

## Warning

**Warning:** This project keeps track of at least 4 remote Terraform state files, one per account. Please review the
Makefile and do not take any actions unless you fully understand the consequences.

For now, make sure that `make -C resources/iam init pull` is executed before taking any action. Other actions in the Makefile
require this action. If you need outputs for a specific environment, load either that AWS CLI profile or export its
credentials to the environment and then execute the following:

```
make -C resources/iam init pull
terraform output -state resources/iam/.terraform/terraform.tfstate
```

Please validate the account ID whenever working with this project and please deploy all changes to all accounts.

## Naming Conventions

Please name resources according to [the naming guide set out in the documentation][iam-policies].

## Directory Organization

Please store resources in the following hierarchy:

 - IAM Policy Resources - `policies.tf`
 - IAM Instance Profiles - `instance_profiles.tf`
 - IAM Roles - `roles.tf`
 - IAM Groups - `groups.tf`
 - IAM Users - `users.tf`

For actual JSON policy blobs, please store them in the `policies/` directory. Please name these files according to the
actual Terraform resource name.

The convention used is to declare actual policy resources like so:

```
resource "aws_iam_policy" "ec2_describe_all" {
  name = "atlas_ec2_describe_all"
  description = "Allows ec2:DescribeInstance on all EC2 instances."
  policy = "${file("${path.module}/policies/ec2_describe_all.json")}"
}
```

Do not use `aws_iam_policy_document` data resources, as these will inflate the size of the Terraform files and not
accomplish much else; use actual JSON blobs in the `policies/` directory.

# Outputs

Due to the nature of this project being used across four AWS accounts, outputs declared by this project must be valid
across all accounts. If it works in one account, it must work in all accounts. Therefore, do not export any ARNs from
this module.

## IAM Assume Roles

`sts:AssumeRole` policies are exported in a dictionary called `service_assume_roles` and at the present two roles are
present therein:

```
ec2 = atlas_ec2_assume_role
redshift = atlas_redshift_assume_role
```

It is expected that roles exported here will allow the given service unconditional access to `sts:AssumeRole`. If
finer-grained access control is required, please consider a Tier-2 or Tier-3 policy.

 [iam-policies]: https://github.com/grindrllc/atlas/wiki/IAM-Policies
