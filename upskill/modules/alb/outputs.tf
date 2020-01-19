output "alb_dns_name" {
  value = aws_lb.alb.dns_name
  description = "The domain name of the load balancer"
}

output "alb_zone_id" {
  value = aws_lb.alb.zone_id
  description = "Zone id of the load balancer"
}

output "alb_id" {
  value = aws_lb.alb.id
  description = "The id of the load balancer"
}
