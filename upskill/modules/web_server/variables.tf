variable "zones" {
  description = "Configurations of each availability zone"
  type        = list(object({
    zone            = string,
    alb_subnet_cidr = string,
    web_subnet_cidr = string,
    db_subnet_cidr  = string
  }))
}

variable "min_size" {
  description = "The minimal number of intances to keep alive"
  type        = number
}

variable "max_size" {
  description = "The maximal number of intances to keep alive"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "web_ami" {
  description = "AMI identifier of the image to be run on EC2"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "server_port" {
  description = "Port number for the web app to listen on"
  type        = number
  default     = 8080
}

variable "vpc_id" {
  description = "VPC identifier for load balancer target group"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet identifiers for load balancer target group in each zone"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group identifier for load balancer target group"
  type        = string
}

variable "https_listener_arn" {
  description = "HTTPS listener arn"
  type        = string
}

variable "env" {
  description = "Current environment"
  type        = string
}
