variable "name" {
  description = "Service name making a part of full resource name"
  type        = string
  default     = "iam"
}

variable "env" {
  description = "Current environment name"
  type        = string
}

variable "owner" {
  description = "Name of the resource owner to be prepended to each resource"
  type        = string
}
