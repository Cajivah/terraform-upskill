output "public_subnet_ids" {
  value = [for x in aws_subnet.public: x.id]
}

output "private_subnet_ids" {
  value = [for x in aws_subnet.private : x.id]
}

output "db_subnets_ids" {
  value = [for x in aws_subnet.db_private_subnet : x.id]
}

output "ig_id" {
  value = aws_internet_gateway.ig.id
}
