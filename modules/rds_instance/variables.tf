variable "environment" {}
variable "aws_region" {}

variable "allocated_storage" {}
variable "engine" {}
variable "engine_version" {}
variable "instance_name" {}

variable "instance_class" {}
variable "dbname" {}
variable "dbusername" {}
variable "dbpassword" {}
variable "role" {}
variable "db_subnet_group_name" {}
variable "security_group_ids" {}

variable "multi_az" {
  default = true
}

variable "backup_retention_period" {
  default = 2
}
