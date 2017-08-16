#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - ${role_package}

write_files:
  - path: /etc/default/exhibitor.cloud
    owner: root:root
    mode: 0644
    content: |
      EXHIBITOR_BUCKET=${bucket}
      EXHIBITOR_ENSEMBLE_SIZE=${instance_count}

  - path: /etc/default/zookeeper.cloud
    owner: root:root
    mode: 0644
    content: |
      ZOOKEEPER_HEAP_PERCENT=${zookeeper_heap_percent}
