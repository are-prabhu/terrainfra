provider "aws" {
  version               = "~> 1.24.0"
  region                = "${var.aws_region}"
  profile               = "${var.aws_profile}"
  forbidden_account_ids = ["${var.forbidden_account_ids}"] # prevent accidental production shenanigans
}

terraform {
  backend "s3" {}
}

data "terraform_remote_state" "network_state" {
  backend = "s3"

  config {
    bucket  = "${var.aws_bucket}"
    region  = "${var.aws_region}"
    key     = "${var.network_state_file}"
    profile = "${var.aws_profile}"
  }
}
