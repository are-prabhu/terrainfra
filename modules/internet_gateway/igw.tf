# create internet gateway, to be associated to a VPC

locals {
  prefix = "${coalesce(var.prefix, var.environment)}-"

  common_tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${var.vpc_id}"

  tags = "${merge(
    local.common_tags,
    map(
        "Name", "${var.environment} | igw | ${var.aws_region}"
    )
  )}"
}
