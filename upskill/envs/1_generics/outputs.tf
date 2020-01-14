output "web_sg_id" {
  value       = aws_security_group.web_sg.id
  description = "The id of the security group for web servers"
}

output "web_subnet_ids" {
  value       = [for x in aws_subnet.web_server_private_subnet : x.id]
  description = "List of security groups' ids prepared for databases"
}


output "db_sg_ids" {
  value       = [for x in aws_security_group.db_sg : x.id]
  description = "List of security groups' ids prepared for databases"
}

output "db_subnet_ids" {
  value       = [for x in aws_subnet.db_private_subnet : x.id]
  description = "List of security groups' ids prepared for databases"
}
