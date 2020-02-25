output "address" {
  description = "Database addres to use in connection string"
  value       = aws_db_instance.jmalyjasiak-db.address
}

output "port" {
  description = "Database port to use in connection string"
  value       = aws_db_instance.jmalyjasiak-db.port
}
