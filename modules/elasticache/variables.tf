variable "cluster_id" {}
variable "engine" {}
variable "node_type" {}
variable "num_cache_nodes" {}
variable "parameter_group_name" {}
variable "port" {}
variable "subnet_group_name" {}

variable "security_group_ids" {
  type = "list"
}

variable "aws_region" {}
variable "environment" {}
