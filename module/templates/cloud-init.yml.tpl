#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - ${role_package}
