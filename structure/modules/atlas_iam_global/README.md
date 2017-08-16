# Atlas IAM Global Module

Resources to be created in every AWS account.

## Resources

### Groups

#### `atlas_godlike_group`

Members of this group have unlimited godlike powers as provided by the `atlas_godlike` policy.

### Roles

#### `atlas_xa_godlike_role`

This role is created in every account but `prod-2.0` and allows users in `prod-2.0` to assume godlike powers in the
target account.

This role has the `atlas_godlike` policy attached to it.

### Policies

#### `atlas_godlike`

Unholy, inhuman, godlike powers. EUID 0.
