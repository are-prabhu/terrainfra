variable "domain_name" {}

variable "elasticsearch_version" {
  default = 6.2
}

variable "instance_type" {}

variable "instance_count" {
  default = 1
}

variable "security_group_ids" {
  type = "list"
}

variable "subnet_ids" {
  type = "list"
}

variable "environment" {}

variable "role" {}
variable "ebs_enabled" {}

variable "volume_size" {}
