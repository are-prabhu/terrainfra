#-------------------------------------------------------------------------------
# main.tf - main module code
#-------------------------------------------------------------------------------

resource "aws_iam_role" "default" {
  name               = "${var.prefix}terraform-ec2-${var.name}"
  description        = "Managed by Terraform"
  assume_role_policy = "${var.trust_policy}"
}

resource "aws_iam_role_policy_attachment" "policies" {
  count      = "${var.attachment_count}"
  role       = "${aws_iam_role.default.name}"
  policy_arn = "${var.attachments[count.index]}"
}

resource "aws_iam_instance_profile" "default" {
  name = "${var.prefix}terraform-${var.name}"
  role = "${aws_iam_role.default.name}"
}
