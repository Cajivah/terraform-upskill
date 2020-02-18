variable "region" {
  default = "eu-north-1"
  type    = string
}

variable "zones" {
  description = "Configuration of network set up per AZ"
  type        = list(object({
    zone            = string,
    alb_subnet_cidr = string,
    web_subnet_cidr = string,
    db_subnet_cidr  = string
  }))
}

variable "min_web_scaling" {
  description = "The minimal number of intances to keep alive"
  type        = number
}

variable "max_web_scaling" {
  description = "The maximal number of intances to keep alive"
  type        = number
}

variable "domain_name" {
  description = "Domain name for the environment. SHOULD BE MATCHING ALREADY EXISTING DOMAIN!"
  type        = string
}

variable "owner" {
  description = "Owner's name to be prepended to resources names"
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
