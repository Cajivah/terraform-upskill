variable "zones" {
  description = "Configurations of each availability zone"
  type        = list(object({
    zone            = string,
    alb_subnet_cidr = string,
    web_subnet_cidr = string,
    db_subnet_cidr  = string
  }))
}

variable "subnet_ids" {
  description = "Subnet identifiers for load balancer target group in each zone"
  type        = list(string)
}

variable "sg_ids" {
  description = "Security group identifier for load balancer target group"
  type        = list(string)
}

variable "name" {
  description = "Load balancer's name"
  type        = string
}

variable "env" {
  description = "Current environment"
  type        = string
}

variable "owner" {
  description = "Owner's name to be added to resources names"
  type        = string
}

variable "vpc_id" {
  description = "VPC identifier"
  type        = string
}

variable "ssl_cert_arn" {
  description = "ARN of a certificate to use in alb config"
  type        = string
}

variable "tags" {
  description = "Map of tags that will be appended to all resources"
  type        = map(string)
}
