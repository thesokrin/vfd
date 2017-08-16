#cloud-config

hostname: ${fqdn}
manage_etc_hosts: true

packages:
  - ${role_package}

write_files:
  - path: /etc/default/codis.cloud
    owner: root
    group: root
    mode: "0644"
    content: |
      REDIS_UPSTREAM=${upstream}
