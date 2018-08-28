resource "aws_iam_policy" "policy" {
  name        = "${var.policy_name}"
  description = "${var.policy_description}"
  path        = "/"
  policy      = "${var.policy_file}"
}
