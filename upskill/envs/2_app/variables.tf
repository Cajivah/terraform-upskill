variable "region" {
  default = "eu-west-1"
  type = string
}

variable "network_state_bucket" {
  description = "Bucket name where network state is stored"
  type = string
}

variable "network_state_key" {
  description = "Key within the bucket where network state is stored"
  type = string
}

variable "zones" {
  description = "Configuration of network set up per AZ"
  type = list(object({
    zone = string,
    alb_subnet_cidr = string,
    web_subnet_cidr = string,
    db_subnet_cidr = string
  }))
}

variable "min_web_scaling" {
  description = "The minimal number of intances to keep alive"
  type = number
}

variable "max_web_scaling" {
  description = "The maximal number of intances to keep alive"
  type = number
}

variable "domain_name" {
  description = "Domain name for the environment. SHOULD BE MATCHING ALREADY EXISTING DOMAIN!"
  type = string
}

variable "env" {
  description = "Environment name"
  type = string
}

variable "ssl_cert_arn" {
  description = "ARN of a certificate to use in alb config"
  type = string
}
