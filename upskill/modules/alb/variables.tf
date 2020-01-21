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

variable "asg_target_group_ids" {
  description = "IDs of target groups containing scallable EC2"
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

variable "vpc_id" {
  description = "VPC identifier"
  type        = string
}

variable "ssl_cert_arn" {
  description = "ARN of a certificate to use in alb config"
  type        = string
}
