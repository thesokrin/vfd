# Atlas RDS Cluster Module

RDS Module is setup to have cluster parameter group and instance configuration with minimum configuration.

- This will setup 1 master instance.
- This has default of 3 slaves instances but can be set to zero.
- This has default of 1 reporting instances but can also be set to zero.
- Provides user friendly master, reporting, and read replica CNAME endpoints.
- Creates KMS Key to be used with this RDS Cluster
