variable "environment" {
  description = "The environment where this profile belongs"
}

variable "prefix" {
  description = "The prefix used for namespacing"
  default     = ""
}

variable "bucket" {
  description = "The bucket name, which will be namespaced"
}

variable "aws_region" {}
