# creates a VPC in AWS
locals {
  prefix = "${coalesce(var.prefix, var.environment)}-"

  common_tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr_block}"
  enable_dns_hostnames = true

  tags = "${merge(
    local.common_tags,
    map(
        "Name", "${var.prefix} | ${var.environment} | ${var.aws_region}"
    )
  )}"
}
