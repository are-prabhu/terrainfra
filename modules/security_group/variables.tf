variable "environment" {
  description = "Environment resources belong to"
}

variable "aws_region" {}
variable "security_groupname" {}
variable "vpc_id" {}

variable "ingress" {
  type = "map"

  default = {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = "0.0.0.0/0"
  }
}

variable "egress" {
  type = "map"

  default = {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = "0.0.0.0/0"
  }
}

# variable "ingress_from_port" {}
# variable "ingress_to_port" {}
# variable "ingress_protocol" {}
# variable "ingress_cidr_blocks" {}
# variable "egress_from_port" {}
# variable "egress_to_port" {}
# variable "egress_protocol" {}
# variable "egress_cidr_blocks" {}

