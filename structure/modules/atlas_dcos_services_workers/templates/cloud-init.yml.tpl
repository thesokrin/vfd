#cloud-config

# terraform variables required:
#   aws_region: the region
#   dcos_bootstrap_id: bootstrap for this version of DC/OS (e73ba2b1cd17795e4dcb3d6647d11a29b9c35084)
#   dcos_cluster_name: name to call this dcos cluster
#   exhibitor_bucket_name: S3 bucket name for the exhibitor bucket
#   exhibitor_bucket_prefix: S3 bucket prefix for exhibitor keys
#   fqdn: Hostname entry hostname + zone
#   internal_master_elb_dns: DNS name for the internal master ELB
#   master_elb_dns: DNS name for the master ELB, I'm not certain how this differs from the internal_master_elb_dns
#   oauth_enabled: boolean whether oauth login is supported
#   zone: DNS zone

users:
  - name: grindr
    gecos: ISRE Team
    groups: [sudo]
    selinux-user: unconfined_u
    ssh_authorized_keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNGOKYp53Sl5Vr/JfN+edBbaNxjV/eSIvQoHPQNC5RExSbRo3D+m0pr7DTbS1QWkwqUdWD3X3jNrtyfXfmVZv2tcT+Cdeit0X07aDL5sJY7uX3BtWQcVc+XDD+xCrdmUfBx1kZ57WWkSjGWPAFf8UZwCGNGjidAOc+fl9GlqO3ZM4dBcW6bzDg3uJFLlFS+//FuVgjJoMWaV8GloUhvxVUWKoQtNTdItZcED2GUoixPQkGVw1faIENZANJhOHM3WB7Ycw+YXoxnqvEvbF/EjQMdKxL0hF0VtEihU/PtodSyh2XUrqyk75B6YFYOFUzC91Oty6eX/VNdaI/qIJlgjfYSwq97xbXziHCQ4hE3c3OCChlykDEseTNMcAwm/Y0rMi+stOjveek+upmJ9RrM43Sr9slv2Nq4jkyI4YzBzl08ZPRb9jyEZ4i30/iPJ3b2iFpraG+/dLvF6JytENXyJVn+6LqG4SRLZYOC4GO35XQpC8ahjaUC+ijtYDtCNSznrU5KFpYfBH8nhJiUcBnaiJzjOkZSyr/C2bj0r9AlpmB+0I8qJPPEAfoSwoPISbssB9XaLEZv7TfxFvq34ERVQ9x8Uw4o6GcOesgl+ZOajAWhV13R/gY1buWEZJv7eRIuH0s56crTpf0HOylDSLsbSj4WnVA9xfclOWEXQyuM15+yQ== isre-shared

hostname: ${fqdn}
fqdn: ${zone}

coreos:
  update:
    reboot-strategy: off

  units:
    # conditionally format /dev/xvbd for /var/lib mount
    - name: format-var-lib.service
      command: start
      content: |
        [Unit]
        Description=Format /dev/xvdb Filesystem as ext4
        Before=var-lib.mount dbus.service
        ConditionPathExists=/dev/xvdb

        [Service]
        Type=oneshot
        RemainAfterExit=yes
        ExecStart=/bin/bash -c "(/usr/sbin/blkid -t TYPE=ext4 | grep xvdb) || /usr/sbin/mkfs.ext4 -L var-lib -F /dev/xvdb"

    # mount xvdb as /var/lib
    - name: var-lib.mount
      command: start
      content: |
        [Unit]
        Description=Mount /dev/xvdb as /var/lib
        Before=dbus.service

        [Mount]
        Type=ext4
        What=/dev/xvdb
        Where=/var/lib

    # create availaiblity zone environment file
    - name: env-populate-az.service
      command: start
      enable: true
      content: |
        [Unit]
        Description=Populate Availability Zone Environment File
        After=network-online.target
        ConditionPathExists=!/etc/sysconfig/availability-zone

        [Service]
        Type=oneshot
        ExecStartPre=/usr/bin/install --directory -m 0755 -o root -g root /etc/sysconfig
        ExecStart=/bin/bash -c "echo AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone) > /etc/sysconfig/availability-zone"

        [Install]
        WantedBy=system-config.target

    # efs admin mount
    - name: grindr-data-shared.mount
      command: start
      enable: true
      content: |
        [Unit]
        Description=Mount EFS Shared Volume
        After=env-populate-az.service
        ConditionPathExists=/etc/sysconfig/availability-zone

        [Mount]
        EnvironmentFile=/etc/sysconfig/availability-zone
        Type=nfs4
        What=efs-admin-$${AZ}:/
        Where=/grindr/data/shared
        Options=defaults,nodev,noexec,nosuid,nfsvers=4.1,rsize=1048576,wsize=1048567,hard,timeo=600,retrans=2

        [Install]
        WantedBy=multi-user.target

    - name: etcd.service
      command: stop
      mask: true

    - name: update-engine.service
      command: stop
      mask: true

    - name: locksmithd.service
      command: stop
      mask: true

    - name: systemd-resolved.service
      command: stop

    - name: systemd-journald.service
      command: restart

    - name: docker.service
      command: restart

    - name: dcos-link-env.service
      command: start
      content: |
        [Unit]
        Before=dcos.target
        [Service]
        Type=oneshot
        StandardOutput=journal+console
        StandardError=journal+console
        ExecStartPre=/usr/bin/mkdir -p /etc/profile.d
        ExecStart=/usr/bin/ln -sf /opt/mesosphere/environment.export /etc/profile.d/dcos.sh

    - name: dcos-download.service
      content: |
        [Unit]
        Description=Pkgpanda: Download DC/OS to this host.
        After=network-online.target
        Wants=network-online.target
        ConditionPathExists=!/opt/mesosphere/
        [Service]
        Type=oneshot
        StandardOutput=journal+console
        StandardError=journal+console
        ExecStartPre=/usr/bin/curl --keepalive-time 2 -fLsSv --retry 20 -Y 100000 -y 60 -o /tmp/bootstrap.tar.xz https://downloads.dcos.io/dcos/stable/bootstrap/${dcos_bootstrap_id}.bootstrap.tar.xz
        ExecStartPre=/usr/bin/mkdir -p /opt/mesosphere
        ExecStart=/usr/bin/tar -axf /tmp/bootstrap.tar.xz -C /opt/mesosphere
        ExecStartPost=-/usr/bin/rm -f /tmp/bootstrap.tar.xz

    - name: dcos-setup.service
      command: start
      enable: true
      no_block: true
      content: |
        [Unit]
        Description=Pkgpanda: Specialize DC/OS for this host.
        Requires=dcos-download.service
        After=dcos-download.service
        [Service]
        Type=oneshot
        StandardOutput=journal+console
        StandardError=journal+console
        EnvironmentFile=/opt/mesosphere/environment
        ExecStart=/opt/mesosphere/bin/pkgpanda setup --no-block-systemd
        [Install]
        WantedBy=multi-user.target

# files
write_files:
  - path: /etc/mesosphere/setup-flags/repository-url
    owner: root
    permissions: "0644"
    content: |
      https://downloads.dcos.io/dcos/stable

  - path: /etc/mesosphere/setup-flags/cluster-packages.json
    owner: root
    permissions: "0644"
    content: |
      ["dcos-config--setup_500d179ba527f84b6fdf5fb37d53631249fc123e", "dcos-metadata--setup_500d179ba527f84b6fdf5fb37d53631249fc123e"]

  - path: /etc/systemd/journald.conf.d/dcos.conf
    permissions: "0644"
    owner: root
    content: |
      [Journal]
      MaxLevelConsole=warning
      RateLimitInterval=1s
      RateLimitBurst=20000

  - path: /etc/rexray/config.yml
    permissions: "0644"
    content: |
      rexray:
        loglevel: info
        modules:
          default-admin:
            host: tcp://127.0.0.1:61003
        storageDrivers: [ec2]
        volume:
          unmount:
            ignoreusedcount: true

  - path: /etc/mesosphere/setup-packages/dcos-provider-aws--setup/etc/mesos-master-provider
    content: |
      MESOS_CLUSTER=${dcos_cluster_name}

  - path: /etc/mesosphere/setup-packages/dcos-provider-aws--setup/etc/adminrouter.env
    content: |
      ADMINROUTER_ACTIVATE_AUTH_MODULE=${oauth_enabled}

  - path: /etc/mesosphere/setup-packages/dcos-provider-aws--setup/etc/dns_config
    content: |
      MASTER_SOURCE=exhibitor_uri
      EXHIBITOR_URI=http://${internal_master_elb_dns}:8181/exhibitor/v1/cluster/status
      EXHIBITOR_ADDRESS=${internal_master_elb_dns}
      RESOLVERS=169.254.169.253

  - path: /etc/mesosphere/setup-packages/dcos-provider-aws--setup/etc/exhibitor
    content: |
      EXHIBITOR_BACKEND=AWS_S3
      AWS_REGION=${aws_region}
      AWS_S3_BUCKET=${exhibitor_bucket_name}
      AWS_S3_PREFIX=${exhibitor_bucket_prefix}

  - path: /etc/mesosphere/setup-packages/dcos-provider-aws--setup/etc/ui-config.json
    content: |
      {
        "uiConfiguration": {
          "plugins": {
            "banner": {
              "enabled": false,
              "backgroundColor": "#1E232F",
              "foregroundColor": "#FFFFFF",
              "headerTitle": null,
              "headerContent": null,
              "footerContent": null,
              "imagePath": null,
              "dismissible": null
            },
            "branding": { "enabled": false },
            "external-links": { "enabled": false },
            "authentication": { "enabled": false },
            "oauth": {
              "enabled": ${oauth_enabled},
              "authHost": "https://dcos.auth0.com"
            },
            "tracking": { "enabled": true }
          }
        }
      }

  - path: /etc/mesosphere/setup-packages/dcos-provider-aws--setup/etc/aws_dnsnames
    content: |
      INTERNAL_MASTER_LB_DNSNAME=${internal_master_elb_dns}
      MASTER_LB_DNSNAME=${master_elb_dns}

  - path: /etc/mesosphere/setup-packages/dcos-provider-aws--setup/pkginfo.json
    content: "{}"

  - path: /etc/mesosphere/roles/slave
    content: ""

  - path: /etc/mesosphere/roles/aws
    content: ""
