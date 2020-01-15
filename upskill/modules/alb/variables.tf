variable "zones" {
  description = "Configurations of each availability zone"
  type = list(object({
    zone = string,
    alb_subnet_cidr = string,
    web_subnet_cidr = string,
    db_subnet_cidr = string
  }))
}

variable "subnet_ids" {
  description = "Subnet identifiers for load balancer target group in each zone"
  type = list(string)
}

variable "sg_ids" {
  description = "Security group identifier for load balancer target group"
  type = list(string)
}

variable "asg_target_group_ids" {
  description = "IDs of target groups containing scallable EC2"
  type = list(string)
}
