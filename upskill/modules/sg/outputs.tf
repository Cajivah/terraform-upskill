output "web_sg_id" {
  value       = aws_security_group.jmalyjasiak-web_sg.id
  description = "The id of the security group for web servers"
}

output "db_sg_ids" {
  value       = [for x in aws_security_group.jmalyjasiak-db_sg : x.id]
  description = "List of security groups' ids prepared for databases"
}

output "alb_sg_ids" {
  value       = [for x in aws_security_group.jmalyjasiak-alb_sg : x.id]
  description = "List of security groups' ids prepared for alb"
}
