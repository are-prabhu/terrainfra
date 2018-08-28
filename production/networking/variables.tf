variable "environment" {
  description = "The environment represented by the managed infrastructure."
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the managed VPC."
}

variable "prefix" {}
variable "forbidden_account_ids" {}
variable "aws_region" {}
variable "aws_profile" {}

variable "subnet_a_public" {}
variable "subnet_b_public" {}
variable "subnet_a_private" {}
variable "subnet_b_private" {}

variable "subnet_a_az" {
  default = "a"
}

variable "subnet_b_az" {
  default = "b"
}

variable "subnet_cidr_block" {
  description = "A map of CIDR blocks for the subnets inside the managed VPC."
  default     = {}
}

variable "master_key_name" {}
variable "bastion_key_name" {}
variable "master_key_ssh_public_key" {}
variable "bastion_key_ssh_public_key" {}
