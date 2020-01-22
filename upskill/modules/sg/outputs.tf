output "web_sg_id" {
  value       = aws_security_group.web_sg
  description = "The id of the security group for web servers"
}

output "db_sg_ids" {
  value       = aws_security_group.db_sg
  description = "List of security groups' ids prepared for databases"
}

output "alb_sg_ids" {
  value       = aws_security_group.alb_sg
  description = "List of security groups' ids prepared for alb"
}
