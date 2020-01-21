output "alb_subnets_ids" {
  value = [for x in aws_subnet.alb_public_subnet : x.id]
}

output "web_subnets_ids" {
  value = [for x in aws_subnet.web_server_private_subnet : x.id]
}

output "db_subnets_ids" {
  value = [for x in aws_subnet.db_private_subnet : x.id]
}

output "ig_id" {
  value = aws_internet_gateway.ig.id
}