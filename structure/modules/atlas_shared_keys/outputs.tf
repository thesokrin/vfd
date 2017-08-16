# Atlas Shared Keys Module - Outputs

output "exported_modules" {
  value = []
}

output "isre_shared" {
  value = "${aws_key_pair.isre_shared.key_name}:${aws_key_pair.isre_shared.fingerprint}"
}
