resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.primary_zone.id
  name    = var.domain_name
  type    = "NS"

  alias {
    name                    = "${var.lb-dns-name}"
    zone_id                 = "${var.lb-zone-id}"
    evaluate_target_health  = true
  }
}
