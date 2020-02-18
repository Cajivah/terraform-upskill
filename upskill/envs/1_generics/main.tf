module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module network {
  source                  = "../../modules/network"
  vpc_id                  = module.vpc.vpc_id
  zones                   = var.zones
  env                     = terraform.workspace
  map_public_ip_on_launch = var.map_public_ip_on_launch
  owner                   = var.owner
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.vpc.vpc_id
  zones  = var.zones
  env    = terraform.workspace
  owner  = var.owner
}


