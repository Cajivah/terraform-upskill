output "instance_profile_name" {
  value = module.iam.instance_profile_name
}

output "web_sg_id" {
  value       = module.sg.web_sg_id
  description = "The id of the security group for web servers"
}

output "db_sg_ids" {
  value       = module.sg.db_sg_ids
  description = "List of security groups' ids prepared for databases"
}

output "alb_sg_ids" {
  value       = module.sg.alb_sg_ids
  description = "List of security groups' ids prepared for alb"
}
