# Atlas Static Services Module

An abstraction for a static instance count service in Atlas.

The following resources will be created:

 - A static set of EC2 instances of arbitrary size.
 - Route 53 DNS Records for Private and Reverse Zones.
 - An optional load balancer.
 - Security groups for the instances and for the optional load balancer.
 - An IAM instance profile shared by all instances.

To create three instances, set `instance_count` to `3` and the following hostnames will be generated:

```
${node}-${index + 1}.${zone}} # e.g. kafka-1.dsci.grindr.io
```

If only one instance needs to be created, set _n_ to 1 and your hostnames will appear like this:

```
${name}.${zone} # e.g. zammad.hub.grindr.io
```
