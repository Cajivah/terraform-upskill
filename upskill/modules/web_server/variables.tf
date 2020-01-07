variable "prefix" {
  description = "Name prefix to make resources unique"
  type = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "ami" {
  description = "AMI identifier of the image to be run on EC2"
  type = string
  default = "ami-0c55b159cbfafe1f0"
}

variable "server_port" {
  description = "Port number for the web app to listen on"
  type = number
  default = 8080
}

variable "vpc_id" {
  description = "VPC identifier for load balancer target group"
  type = string
}

variable "subnet_id" {
  description = "Subnet identifier for load balancer target group"
  type = string
}

variable "security_group_id" {
  description = "Security group identifier for load balancer target group"
  type = string
}
