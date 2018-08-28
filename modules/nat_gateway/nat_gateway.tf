# create an elastic IP and associate to a newly created NAT gateway

locals {
  common_tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_eip" "nat_gateway_ip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.nat_gateway_ip.id}"
  subnet_id     = "${var.subnet_id}"

  tags = "${merge(
    local.common_tags,
    map(
        "Name", "${var.environment} | nat-gateway | ${var.aws_region}"
    )
  )}"
}
