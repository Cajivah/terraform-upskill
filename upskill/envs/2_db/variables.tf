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

variable "owner" {
  description = "Owner's name to be prepended to resources names"
  type        = string
}

variable "tags" {
  description = "Map of tags that will be appended to all resources"
  type        = map(string)
}
