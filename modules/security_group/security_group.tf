locals {
  common_tags = {
    Environment = "${var.environment}"
  }
}

resource "aws_security_group" "security_group" {
  name   = "${var.security_groupname}"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = "${var.ingress["from_port"]}"
    to_port   = "${var.ingress["to_port"]}"
    protocol  = "${var.ingress["protocol"]}"

    # security_groups = ["${var.ingress["security_group_id"]}"]
    cidr_blocks = ["${var.ingress["cidr_blocks"]}"]
  }

  egress {
    from_port   = "${var.egress["from_port"]}"
    to_port     = "${var.egress["to_port"]}"
    protocol    = "${var.egress["protocol"]}"
    cidr_blocks = ["${var.egress["cidr_blocks"]}"]
  }

  tags = "${merge(
    local.common_tags,
    map(
        "Name", "${var.security_groupname} | instance "
    )
  )}"
}
