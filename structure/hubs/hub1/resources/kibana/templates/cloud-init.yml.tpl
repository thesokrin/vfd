#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - grindr-role-kibana
