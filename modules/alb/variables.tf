variable "alb_name" {}

variable "security_groups" {
  type = "list"
}

variable "subnet_ids" {
  type = "list"
}

variable "environment" {}
variable "aws_region" {}
variable "target_group_name" {}
variable "vpc_id" {}
variable "target_type" {}

# variable "instance_ids" {
#   type = "list"
# }

variable "domain" {}
