#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - grindr-role-elasticsearch

write_files:
- path: /etc/default/grindr-elasticsearch
  owner: root:root
  mode: 0644
  content: |
    ELASTICSEARCH_CLUSTER_ID=${elasticsearch_cluster_id}
