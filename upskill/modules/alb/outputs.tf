output "alb_dns_name" {
  value = aws_lb.alb.dns_name
  description = "The domain names of the load balancers"
}
