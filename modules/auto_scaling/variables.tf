variable "image_id" {}
variable "key_name" {}

variable "vpc_security_group_ids" {
  type = "list"
}

# variable "load_balancers_ids" {
#   type = "list"
# }

variable "vpc_zone_identifier" {
  type = "list"
}

variable "target_group_arns" {
  type = "list"
}

variable "launch_template_name" {}
variable "environment" {}
