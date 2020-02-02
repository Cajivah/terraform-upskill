locals {
  http_tg_name  = "${local.domain_prefix}_http"
  domain_prefix = "${var.owner}_${var.name}_${var.env}"

  https_port     = 443
  http_port      = 80
  https_protocol = "HTTPS"
  http_protocol  = "HTTP"
}
