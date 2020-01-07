variable "vpc_cidr" {
  description = "Main VPC CIDR block"
  type = string
  default = "10.0.0.0/20"
}

variable "region" {
  default = "eu-west-1"
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
  default = [
    {
      zone = "us-west-2a",
      alb_subnet_cidr = "10.0.0.0/28",
      web_subnet_cidr = "10.0.192.0/26",
      db_subnet_cidr = "10.0.0.16/28"
    },
    {
      zone = "us-west-2b"
      alb_subnet_cidr = "10.1.0.0/28",
      web_subnet_cidr = "10.1.192.0/26",
      db_subnet_cidr = "10.1.0.16/28"
    },
    {
      zone = "us-west-2c"
      alb_subnet_cidr = "10.2.0.0/28",
      web_subnet_cidr = "10.2.192.0/26",
      db_subnet_cidr = "10.2.0.16/28"
    }
  ]
}
