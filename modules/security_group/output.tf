# outputs produced at the end of a terraform apply: id of base route table
output "security_group_id" {
  value = "${aws_security_group.security_group.id}"
}
