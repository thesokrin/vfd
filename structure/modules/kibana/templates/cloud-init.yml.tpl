#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - ${role_package}

write_files:
- path: /etc/default/kibana.cloud
  owner: root:root
  mode: 0644
  content: |
    ELASTICSEARCH_HOST=${elasticsearch_host}
