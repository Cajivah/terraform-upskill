output "address" {
  description = "Database addres to use in connection string"
  value       = module.db.address
}

output "port" {
  description = "Database port to use in connection string"
  value       = module.db.port
}

output "web_db_username_key" {
  description = "Database username key to fetch it's value from parameter store"
  value       = local.db_username_key
}

output "web_db_password_key" {
  description = "Database password key to fetch it's value from parameter store"
  value       = local.db_password_key
}
