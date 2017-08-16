#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - grindr-role-collect

write_files:
- path: /etc/default/collect
  owner: root:root
  mode: 0644
  content: |
    COLLECT_LOGS_DESTINATION=${logs_destination}
    COLLECT_METRICS_DESTINATION=${metrics_destination}
