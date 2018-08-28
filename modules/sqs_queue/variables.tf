variable "sqs_name" {}

variable "delay_seconds" {
  default = 0
}

variable "max_message_size" {
  default = 2048
}

variable "message_retention_seconds" {
  default = 345600
}

variable "receive_wait_time_seconds" {
  default = 0
}

variable "role" {}
variable "environment" {}
variable "aws_region" {}
