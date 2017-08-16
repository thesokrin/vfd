#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - ${package_role}

