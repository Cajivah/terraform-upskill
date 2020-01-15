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

variable "min_size" {
  description = "The minimal number of intances to keep alive"
  type = number
}

variable "max_size" {
  description = "The maximal number of intances to keep alive"
  type = number
}
