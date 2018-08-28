################### AWS VPC resource variables ######################
### the variables in this file are passed in at environment level ###

# vpc variable
variable cidr_block {}

# tag variable
variable environment {
  description = "Environment resources belong to"
}

variable "prefix" {
  description = "The prefix used to distinguish managed infrastructure resources. If blank, defaults to the value of environment."
}

variable aws_region {}

variable vpc_cidr_block {}
