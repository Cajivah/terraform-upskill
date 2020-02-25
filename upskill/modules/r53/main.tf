resource "aws_route53_record" "jmalyjasiak-www" {
  zone_id = data.aws_route53_zone.primary_zone.id
  name    = "${var.env}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.lb_dns_name
    zone_id                = var.lb_zone_id
    evaluate_target_health = true
  }
}
