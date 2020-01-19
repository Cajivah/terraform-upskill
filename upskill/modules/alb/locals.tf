locals {
  cluster_name = "${var.env}_web"
  default_tg_name = "default-${var.env}-tg"
  lb_name = "${var.name}_${var.env}_alb"
  tls_1_2 = "ELBSecurityPolicy-TLS-1-2-2017-01"

  https_port = 443
  http_port = 80
  https_protocol = "HTTPS"
  http_protocol = "HTTP"
  http_redirect = "HTTP_301"

}
