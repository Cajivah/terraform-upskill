output "ec2_address" {
  value       = aws_autoscaling_group.web_asg.id
  description = "Ids of autoscaling groups"
}

output "asg_tg_ids" {
  value       = [for x in aws_lb_target_group.web_asg_tg : x.id]
  desctiption = "Identifiers of target groups"
}

