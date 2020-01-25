module r53 {
  source         = "../../modules/r53"
  domain_name    = var.domain_name
  subdomain_name = local.subdomain
  lb_dns_name    = module.alb.alb_dns_name
  lb_zone_id     = module.alb.alb_zone_id
  env            = var.env
  tags           = var.tags
}

module "web_server" {
  source                = "../../modules/web_server"
  zones                 = var.zones
  security_group_id     = local.generics_web_sg_id
  subnet_ids            = local.generics_private_subnet_ids
  vpc_id                = local.generics_vpc_id
  instance_profile_name = local.generics_instance_profile_name

  max_size = var.max_web_scaling
  min_size = var.min_web_scaling

  https_listener_arn = module.alb.https_listener_arn
  env                = var.env
  service_name       = local.service_name
  tags               = var.tags
}

module "db" {
  source             = "../../modules/db"
  db_password        = "admin"
  db_name            = "test"
  zones              = var.zones
  subnet_ids         = local.generics_db_subnet_ids
  security_group_ids = local.generics_db_sg_ids
  tags               = var.tags
  env                = var.env
}

module "alb" {
  source              = "../../modules/alb"
  zones               = var.zones
  subnet_ids          = local.generics_public_subnet_ids
  sg_ids              = local.generics_alb_sg_ids
  env                 = var.env
  name                = "main"
  vpc_id              = local.generics_vpc_id
  ssl_cert_arn        = var.ssl_cert_arn
  tags                = var.tags
}
