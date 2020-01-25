variable "region" {
  default = "eu-north-1"
  type    = string
}

variable "generics_state_bucket" {
  description = "Bucket name where generics state is stored"
  type        = string
  default     = "jmalyjasiak-upskill"
}

variable "generics_state_key" {
  description = "Key within the bucket where generics state is stored"
  type        = string
  default     = "envs/generics/terraform.tfstate"
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

variable "env" {
  description = "Environment name"
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
