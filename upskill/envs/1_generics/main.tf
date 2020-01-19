module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "ig" {
  source = "../../modules/ig"
  vpc_id = module.vpc.vpc_id
}

module r53 {
  source = "../../modules/r53"
  domain_name = var.domain_name
}

module subnet {
  source = "../../modules/subnet"
  vpc_id = module.vpc.vpc_id
  zones = var.zones
}

module "security" {
  source = "../../modules/security"
  vpc_id = module.vpc.vpc_id
  zones = var.zones
}


