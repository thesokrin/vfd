#cloud-config
system_info:
  default_user:
    name: grindr
    gecos: Grindr Account
    lock_passwd: true
    shell: /bin/bash
    ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNGOKYp53Sl5Vr/JfN+edBbaNxjV/eSIvQoHPQNC5RExSbRo3D+m0pr7DTbS1QWkwqUdWD3X3jNrtyfXfmVZv2tcT+Cdeit0X07aDL5sJY7uX3BtWQcVc+XDD+xCrdmUfBx1kZ57WWkSjGWPAFf8UZwCGNGjidAOc+fl9GlqO3ZM4dBcW6bzDg3uJFLlFS+//FuVgjJoMWaV8GloUhvxVUWKoQtNTdItZcED2GUoixPQkGVw1faIENZANJhOHM3WB7Ycw+YXoxnqvEvbF/EjQMdKxL0hF0VtEihU/PtodSyh2XUrqyk75B6YFYOFUzC91Oty6eX/VNdaI/qIJlgjfYSwq97xbXziHCQ4hE3c3OCChlykDEseTNMcAwm/Y0rMi+stOjveek+upmJ9RrM43Sr9slv2Nq4jkyI4YzBzl08ZPRb9jyEZ4i30/iPJ3b2iFpraG+/dLvF6JytENXyJVn+6LqG4SRLZYOC4GO35XQpC8ahjaUC+ijtYDtCNSznrU5KFpYfBH8nhJiUcBnaiJzjOkZSyr/C2bj0r9AlpmB+0I8qJPPEAfoSwoPISbssB9XaLEZv7TfxFvq34ERVQ9x8Uw4o6GcOesgl+ZOajAWhV13R/gY1buWEZJv7eRIuH0s56crTpf0HOylDSLsbSj4WnVA9xfclOWEXQyuM15+yQ==

hostname: ${fqdn}
fqdn: ${zone}
manage_etc_hosts: true

# s3 does not support pipelining
apt_pipelining: false
apt_update: true

apt_sources:
    - filename: apt.grindr.io.list
      source: "deb https://s3.amazonaws.com/apt.grindr.io/ubuntu/trusty stable main"
      key: |
        -----BEGIN PGP PUBLIC KEY BLOCK-----
        Version: GnuPG v1

        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
        =7JXg
        -----END PGP PUBLIC KEY BLOCK-----

packages:
  - nfs-common
  - grindr-role-presence

runcmd:
  # mount nfs
  - test -d /grindr/data/shared || mkdir -p /grindr/data/shared
  - grep -oP '^efs-admin' /etc/fstab || echo "efs-admin-$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone):/ /grindr/data/shared nfs4 defaults,nodev,noexec,nosuid,nfsvers=4.1,rsize=1048576,wsize=1048567,hard,timeo=600,retrans=2 0 0" >> /etc/fstab
  - mount -a
