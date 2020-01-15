output "alb_dns_name" {
  value = [for x in aws_lb.alb : x.dns_name]
  description = "The domain names of the load balancers"
}

output "alb_id" {
  value = [for x in aws_lb.alb : x.id]
  description = "The ids of the load balancers"
}
