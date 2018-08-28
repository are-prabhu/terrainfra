variable "prefix" {
  description = "The environment where this profile belongs"
}

variable "name" {
  description = "A unique identifier for this instance profile"
}

variable "trust_policy" {
  description = "Trust policy for the created IAM role"
}

variable "attachments" {
  description = "A list of policy ARNs attached to this instance profile"
  default     = []
}

variable "attachment_count" {
  description = "The number of policies attached to this instance profile (workaround for issue #12570)"
}
