variable "vpc_cidr" {
  description = "Main VPC CIDR block"
  type        = string
}

variable "region" {
  description = "AWS region to run the app in"
  type        = string
}

variable "owner" {
  description = "Owner's name to be prepended to resources names"
  type        = string
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

variable "allowed_external_ips" {
  description = "IPs allowed to access the system"
  type        = list(string)
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "Map public ip on launch"
  type        = bool
}
