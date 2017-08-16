# Atlas Manager Module

An Atlas Project module which creates the necessary resources for a bastion host for a given Atlas Environment or Hub.

## Resources

 - A bastion host for accessing an environment or hub and corresponding security groups and cloud-init configuration.
 - Two public DNS records for `manager` and `spinaltap`, which are the same and are public entry-points into the bastion
   host.
 - Private and reverse DNS records for the bastion host.
 - A static public IP address for the bastion host via an Elastic IP Address.
 - A static private IP address for the bastion host at `10.*.1.10`.
