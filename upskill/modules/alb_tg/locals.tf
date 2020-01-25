locals {
  name = "${var.name}-${var.env}-http"

  https_port     = 443
  http_port      = 80
  https_protocol = "HTTPS"
  http_protocol  = "HTTP"
}
