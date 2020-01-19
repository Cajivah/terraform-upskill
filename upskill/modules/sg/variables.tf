variable "vpc_id" {
  description = "Id of the vpc to put subnets in"
  type        = string
}

variable "zones" {
  description = "Configuration of network set up per AZ"
  type = list(object({
    zone            = string,
    alb_subnet_cidr = string,
    web_subnet_cidr = string,
    db_subnet_cidr  = string
  }))
}

variable "allowed_external_ips" {
  description = "IPs allowed to access the system"
  type        = string
  default     = ["0.0.0.0/0"]
}