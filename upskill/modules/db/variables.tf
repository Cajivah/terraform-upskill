variable "db_name" {
  description = "The name to use for the database"
  type        = string
}

variable "db_username_key" {
  description = "Root username key to fetch value from parameter store"
  type        = string
}

variable "db_password_key" {
  description = "Root user password key to fetch value from parameter store"
  type        = string
}


variable "instance_type" {
  description = "The type of the instance that db engine runs on"
  type        = string
  default     = "db.t3.micro"
}

variable "zones" {
  description = "Configurations of each availability zone"
  type        = list(object({
    zone            = string,
    alb_subnet_cidr = string,
    web_subnet_cidr = string,
    db_subnet_cidr  = string
  }))
}

variable "subnet_ids" {
  description = "Ids of the subnet to put db in"
  type        = list(string)
}

variable "security_group_ids" {
  description = "ID of the security group to put the db in"
  type        = list(string)
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "8.0.16"
}

variable "allocated_storage" {
  description = "TODO"
  type        = number
  default     = 10
}

variable "env" {
  description = "Current environment name"
  type        = string
}

variable "identifier" {
  description = "Identifier to be added to resources names"
  type        = string
}

variable "owner" {
  description = "Owner's name to be added to resources names"
  type        = string
}

variable "tags" {
  description = "Map of tags that will be appended to all resources"
  type        = map(string)
}
