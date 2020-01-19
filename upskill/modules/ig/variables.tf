variable "vpc_id" {
  type = string
  description = "Id of VPC spanning all services"
}

variable "name" {
  type = string
  description = "Name added as a tag to the resource"
  default = "ig"
}
