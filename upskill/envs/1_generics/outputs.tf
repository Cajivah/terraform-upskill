output "web_sg_id" {
  value       = module.security.web_sg_id
  description = "The id of the security group for web servers"
}

output "web_subnet_ids" {
  value       = module.network.web_subnets_ids
  description = "List of security groups' ids prepared for databases"
}


output "db_sg_ids" {
  value       = module.security.db_sg_ids
  description = "List of security groups' ids prepared for databases"
}

output "db_subnet_ids" {
  value       = module.network.db_subnets_ids
  description = "List of security groups' ids prepared for databases"
}

output "alb_sg_ids" {
  value       = module.security.alb_sg_ids
  description = "List of security groups' ids prepared for alb"
}

output "alb_subnet_ids" {
  value       = module.network.alb_subnets_ids
  description = "List of security groups' ids prepared for alb"
}

output "instance_profile_name" {
  value = module.security.instance_profile_name
}
