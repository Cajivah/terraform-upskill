output "ec2_address" {
  value       = aws_autoscaling_group.web_asg.id
  description = "Ids of autoscaling groups"
}
