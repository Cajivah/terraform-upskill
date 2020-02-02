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

variable "env" {
  description = "Environment name"
  type        = string
}

variable "owner" {
  description = "Owner's name to be prepended to resources names"
  type        = string
}

variable "tags" {
  description = "Map of tags that will be appended to all resources"
  type        = map(string)
}
