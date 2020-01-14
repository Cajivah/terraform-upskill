output "ec2_address" {
  value       = aws_instance.web.private_ip
  description = "Private ip of ec2"
}
