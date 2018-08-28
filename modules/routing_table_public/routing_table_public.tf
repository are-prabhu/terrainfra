# create a private route table, to be included as part of private subnet modules
# and associated to a NAT gateway

locals {
  common_tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "${var.cidr_block}"
    gateway_id = "${var.gateway_id}"
  }

  tags {
    Name = "${var.environment} | ${var.purpose} | routing-table | ${var.aws_region}"
  }
}
