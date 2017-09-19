# Atlas Development Environment - Mesos Masters Security Group Resources

# instance security group
resource "aws_security_group" "default" {
  name = "mesos-master.${var.zone}"
  description = "Security group for Mesos Master/ZooKeeper instances in the Atlas Dev Environment."
  vpc_id = "${var.vpc_id}"

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = [
      "${var.env_cidr_block}",
      "${var.hub_cidr_block}",
      "${var.lahq_cidr_block}",
    ]
  }

  # ingress to the dashboard from the dmz dash elb
  ingress {
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["${var.layer_dmz_cidr_blocks}"]
  }

  ingress {
    protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_blocks = ["${var.layer_dmz_cidr_blocks}"]
  }

  # ingress to mesos master port from within the admin subnets; LB will forward from other subnets
  ingress {
    protocol = "tcp"
    from_port = 5050
    to_port = 5050
    cidr_blocks = ["${var.layer_admin_cidr_blocks}"]
  }

  # ingress to zookeeper client port from public, services, and admin
  ingress {
    protocol = "tcp"
    from_port = 2181
    to_port = 2181
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # ingress to zookeeper peer port from within admin
  ingress {
    protocol = "tcp"
    from_port = 2888
    to_port = 2888
    cidr_blocks = ["${var.layer_admin_cidr_blocks}"]
  }

  # ingress to zookeeper leader election port from within admin
  ingress {
    protocol = "tcp"
    from_port = 3888
    to_port = 3888
    cidr_blocks = ["${var.layer_admin_cidr_blocks}"]
  }

  # ingress to exhibitor http port
  ingress {
    protocol = "tcp"
    from_port = 8181
    to_port = 8181
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # TODO FIXME we do not understand which ports DC/OS actually needs open
  #            if we ever reach the point that we do, we should lock this down
  ingress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["${var.env_cidr_block}"]
  }

  # egress to anywhere is allowed
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "mesos-master.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "admin"
    atlas_project = "mesos_masters"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# load-balancer security group
resource "aws_security_group" "loadbalancer" {
  name = "mesos-master-elb.${var.zone}"
  description = "Security group for the Mesos Master load balancer in the Atlas Dev Environment."
  vpc_id = "${var.vpc_id}"

  # ingress from public, services, and admin to zookeeper port
  ingress {
    protocol = "tcp"
    from_port = 2181
    to_port = 2181
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # ingress from public, services, and admin to mesos master port
  ingress {
    protocol = "tcp"
    from_port = 5050
    to_port = 5050
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # ingress from admin to exhibitor port
  ingress {
    protocol = "tcp"
    from_port = 8181
    to_port = 8181
    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # egress to anywhere for now
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "mesos-master-elb.${var.zone}"
    # atlas variables
    atlas_zone = "${var.zone}"
    atlas_environment = "${var.env_name}"
    atlas_layer = "admin"
    atlas_project = "mesos_masters"
    atlas_owner = "isre"
  }

  lifecycle {
    create_before_destroy = true
  }
}
