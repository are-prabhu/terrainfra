output "name" {
  description = "Instance profile name"
  value       = "${aws_iam_instance_profile.default.name}"
}

output "role_arn" {
  value = "${aws_iam_role.default.arn}"
}
