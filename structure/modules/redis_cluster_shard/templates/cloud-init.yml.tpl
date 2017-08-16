#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - ${role_package}

write_files:
  - path: /etc/default/redis.cloud
    owner: root:root
    mode: 0644
    content: |
      REDIS_CLUSTER_NAME=${cluster_name}
      REDIS_DEFAULT_ROLE=${redis_role}
