variable "db_password" {
  description = "The password for the database"
  type        = string
}

variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = "example_database_stage"
}

variable "instance_type" {
  description = "The type of the instance that db engine runs on"
  type = string
  default = "db.t2.micro"
}

variable "prefix" {
  description = "Names prefix to make resources unique"
  type = string
}

variable "subnet_ids" {
  description = "Ids of the subnets to put db in"
  type = set(string)
}

variable "security_group_id" {
  description = "ID of the security group to put the db in"
  type = string
}

variable "engine"{
  description = "Database engine"
  type = string
  default = mysql
}

variable "engine_version"{
  description = "Database engine version"
  type = string
  default = "8.0.16"
}

variable "allocated_storage" {
  description = "TODO"
  type = number
  default = 10
}

variable "username" {
  description = "Root db user name"
  type = string
  default = "admin"
}
