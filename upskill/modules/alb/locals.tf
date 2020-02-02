locals {
  domain_prefix   = "${var.owner}-${var.name}-${var.env}"
  cluster_name    = "${local.domain_prefix}-web"
  default_tg_name = "${local.domain_prefix}-default-tg"
  lb_name         = "${local.domain_prefix}-alb"
  tls_1_2         = "ELBSecurityPolicy-TLS-1-2-2017-01"

  https_port     = 443
  http_port      = 80
  https_protocol = "HTTPS"
  http_protocol  = "HTTP"
  http_redirect  = "HTTP_301"
}
