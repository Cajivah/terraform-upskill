module "network_setup" {
  source = "..\/..\/modules\/sg"

  count = length(zones)
  vpc_id = aws_vpc.vpc.id
  zone = local.zones[count.index].zone
  alb_cidr = local.zones[count.index].alb_subnet_cidr
  web_cidr = local.zones[count.index].web_subnet_cidr
  db_cidr = local.zones[count.index].db_subnet_cidr
}

