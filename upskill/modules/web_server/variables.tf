variable "zones" {
  description = "Configurations of each availability zone"
  type        = list(object({
    zone            = string,
    alb_subnet_cidr = string,
    web_subnet_cidr = string,
    db_subnet_cidr  = string
  }))
}

variable "db_address" {
  description = "Database address"
  type        = string
}

variable "db_port" {
  description = "Database port"
  type        = string
}

variable "db_username_key" {
  description = "Database username to fetch it from ssm"
  type        = string
}

variable "db_password_key" {
  description = "Database password key to fetch it from ssm"
  type        = string
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
  default     = "t3.micro"
}

variable "web_ami" {
  description = "AMI identifier of the image to be run on EC2"
  type        = string
  default     = "ami-0662eb9b9b8685935"
}

variable "server_port" {
  description = "Port number for the web app to listen on"
  type        = number
  default     = 80
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


variable "instance_profile_name" {
  description = "EC2 instance profile name"
  type        = string
}

variable "env" {
  description = "Current environment"
  type        = string
}

variable "app_name" {
  description = "Application's name"
  type        = string
}

variable "tags" {
  description = "Current environment"
  type        = map(string)
}

variable "owner" {
  type        = string
  description = "Resource owner name to be prepended to resources names"
}

variable "region" {
  type        = string
  description = "Region that environment runs in"
}
