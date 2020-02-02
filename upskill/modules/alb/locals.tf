locals {
  domain_prefix   = "${var.owner}_${var.name}_${var.env}"
  cluster_name    = "${local.domain_prefix}_web"
  default_tg_name = "${local.domain_prefix}_default_tg"
  lb_name         = "${local.domain_prefix}_alb"
  tls_1_2         = "ELBSecurityPolicy-TLS-1-2-2017-01"

  https_port     = 443
  http_port      = 80
  https_protocol = "HTTPS"
  http_protocol  = "HTTP"
  http_redirect  = "HTTP_301"
}
