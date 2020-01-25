output "ec2_address" {
  value       = aws_autoscaling_group.web_asg.id
  description = "Ids of autoscaling groups"
}

output "asg_tg_id" {
  value       = module.alb-tg.alb-tg-arn
  description = "Identifiers of target groups"
}

