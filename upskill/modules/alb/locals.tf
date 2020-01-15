locals {
  cluster_name = "${var.zones[count.index].zone}_web"
  https_port = 443
  https_protocol = "HTTPS"
}
