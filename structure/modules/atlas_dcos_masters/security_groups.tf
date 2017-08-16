# Atlas DC/OS Masters Module - Security Groups

# instance security group
resource "aws_security_group" "default" {
  name        = "dcos-master.${var.zone}"
  description = "Security group for DC/OS Master/ZooKeeper instances in the ${var.stack_name_fancy}."
  vpc_id      = "${var.vpc_id}"

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22

    cidr_blocks = [
      "${var.cidr_block}",
      "${var.hub_cidr_block}",
      "${var.lahq_cidr_block}",
    ]
  }

  # ingress to the dashboard from the dmz dash elb
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["${var.layer_dmz_cidr_blocks}"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["${var.layer_dmz_cidr_blocks}"]
  }

  # ingress to dcos master port from within the admin subnets; LB will forward from other subnets
  ingress {
    protocol    = "tcp"
    from_port   = 5050
    to_port     = 5050
    cidr_blocks = ["${var.layer_admin_cidr_blocks}"]
  }

  # ingress to zookeeper client port from public, services, and admin
  ingress {
    protocol  = "tcp"
    from_port = 2181
    to_port   = 2181

    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # ingress to zookeeper peer port from within admin
  ingress {
    protocol    = "tcp"
    from_port   = 2888
    to_port     = 2888
    cidr_blocks = ["${var.layer_admin_cidr_blocks}"]
  }

  # ingress to zookeeper leader election port from within admin
  ingress {
    protocol    = "tcp"
    from_port   = 3888
    to_port     = 3888
    cidr_blocks = ["${var.layer_admin_cidr_blocks}"]
  }

  # ingress to exhibitor http port
  ingress {
    protocol  = "tcp"
    from_port = 8181
    to_port   = 8181

    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # TODO FIXME we do not understand which ports DC/OS actually needs open
  #            if we ever reach the point that we do, we should lock this down
  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["${var.cidr_block}"]
  }

  # egress to anywhere is allowed
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "dcos-master.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.stack_name}"
    atlas_layer       = "admin"
    atlas_owner       = "isre"
    atlas_project     = "dcos_masters"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# load-balancer security group
resource "aws_security_group" "loadbalancer" {
  name        = "dcos-master-elb.${var.zone}"
  description = "Security group for the DC/OS Master load balancer in the Atlas Dev Environment."
  vpc_id      = "${var.vpc_id}"

  # ingress from public, services, and admin to zookeeper port
  ingress {
    protocol  = "tcp"
    from_port = 2181
    to_port   = 2181

    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # ingress from public, services, and admin to dcos master port
  ingress {
    protocol  = "tcp"
    from_port = 5050
    to_port   = 5050

    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # ingress from admin to exhibitor port
  ingress {
    protocol  = "tcp"
    from_port = 8181
    to_port   = 8181

    cidr_blocks = ["${concat(
      var.layer_admin_cidr_blocks,
      var.layer_public_cidr_blocks,
      var.layer_services_cidr_blocks
    )}"]
  }

  # egress to anywhere for now
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "dcos-master-elb.${var.zone}"

    # atlas variables
    atlas_zone        = "${var.zone}"
    atlas_environment = "${var.stack_name}"
    atlas_layer       = "admin"
    atlas_owner       = "isre"
    atlas_project     = "mesos_masters"
  }

  lifecycle {
    create_before_destroy = true
  }
}
