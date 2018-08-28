output "iam_policy_id" {
  value = "${aws_iam_policy.policy.id}"
}

output "iam_policy_arn" {
  value = "${aws_iam_policy.policy.arn}"
}
