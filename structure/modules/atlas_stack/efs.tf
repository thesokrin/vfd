# Atlas Stack - EFS Resources

resource "aws_efs_file_system" "admin" {
  tags {
    Name = "${var.zone}"
    atlas_zone = "${var.zone}"
    atlas_layer = "admin"
  }
}

resource "aws_efs_mount_target" "admin" {
  count = 3

  file_system_id = "${aws_efs_file_system.admin.id}"
  subnet_id = "${module.admin.subnet_ids[count.index]}"
  security_groups = ["${aws_security_group.efs.id}"]
}

resource "aws_route53_record" "efs-admin" {
  count = 3

  name = "efs-admin-${module.admin.availability_zones[count.index]}"
  zone_id = "${aws_route53_zone.private.id}"
  type = "CNAME"
  ttl = "60"
  records = ["${element(aws_efs_mount_target.admin.*.dns_name, count.index)}"]
}
