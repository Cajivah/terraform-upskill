locals {
  http_port        = 80
  https_port       = 443
  db_port          = 3306
  any_port         = 0
  any_protocol     = "-1"
  tcp_protocol     = "tcp"
  any_ip           = "0.0.0.0/0"
  alb_subnet_cidrs = [for zone in var.zones : zone.alb_subnet_cidr]

  domain_prefix   = "${var.owner}_${var.name}_${var.env}"
  public_rt_name  = "${local.domain_prefix}_public_rt"
  private_rt_name = "${local.domain_prefix}_private_rt"
  nat_name        = "${local.domain_prefix}_nat"
  ig_name         = "${local.domain_prefix}_ig"
}
