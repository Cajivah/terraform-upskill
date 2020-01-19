variable "vpc_cidr" {
  description = "Main VPC CIDR block"
  type = string
  default = "10.0.0.0/20"
}

variable "region" {
  description = "AWS region to run the app in"
  type = string
}

variable "env" {
  description = "Environment name"
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

variable "allowed_external_ips" {
  description = "IPs allowed to access the system"
  type = string
  default = [
    "0.0.0.0/0"]
}
