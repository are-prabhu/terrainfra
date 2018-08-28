###################### AWS Internet Gateway variables ##########################
######## the variables in this file are passed in at environment level #########

# IGW variables
variable vpc_id {}

variable prefix {}
variable aws_region {}

# tag variable
variable environment {
  description = "Environment resources belong to"
}
