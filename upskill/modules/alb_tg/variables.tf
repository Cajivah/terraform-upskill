variable "name" {
  description = "Load balancer's name"
  type        = string
}

variable "env" {
  description = "Current environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC identifier"
  type        = string
}

variable "https_listener_arn" {
  description = "HTTPS listener arn"
  type        = string
}

variable "health_check_path" {
  description = "Path to send health check to"
  type        = string
}

variable "tags" {
  description = "Map of tags that will be appended to all resources"
  type = map(string)
}
