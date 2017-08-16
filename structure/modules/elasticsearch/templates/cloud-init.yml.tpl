#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - ${role_package}

write_files:
- path: /etc/default/elasticsearch.cloud
  owner: root:root
  mode: 0644
  content: |
    ELASTICSEARCH_CLUSTER_ID=${elasticsearch_cluster_id}
    ELASTICSEARCH_CLUSTER_NAME=${name}
    ELASTICSEARCH_CLUSTER_SIZE=${size}
