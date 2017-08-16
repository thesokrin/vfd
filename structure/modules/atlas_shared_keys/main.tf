# Atlas Shared Keys Module

resource "aws_key_pair" "isre_shared" {
  key_name = "isre-shared"
  public_key = "${file("${path.module}/keymaterial/isre-shared.pub")}"
}
