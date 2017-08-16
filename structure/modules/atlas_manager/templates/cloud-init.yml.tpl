#cloud-config

hostname: ${fqdn}
fqdn: ${zone}
manage_etc_hosts: true

packages:
  - grindr-role-manager
