output "alb_dns_name" {
  value = aws_lb.jmalyjasiak-alb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.jmalyjasiak-alb.zone_id
}

output "alb_id" {
  value = aws_lb.jmalyjasiak-alb.id
}

output "https_listener_arn" {
  value = aws_lb_listener.jmalyjasiak-lb-listener-https.arn
}
