locals {
  http_port    = 80
  https_port   = 443
  db_port      = 3306
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  any_ip = "0.0.0.0/0"
  alb_subnet_cidrs = [for zone in var.zones : zone.alb_subnet_cidr]

  public_rt_name = "${var.env}_public_rt"
}
