data "aws_route53_zone" "primary_zone" {
  name = "${var.domain_name}."
}
