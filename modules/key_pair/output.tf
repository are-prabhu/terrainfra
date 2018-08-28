# outputs produced at the end of a terraform apply: id of base route table
output "key_name" {
  value = "${aws_key_pair.key_pair.key_name}"
}
