module sg {
  source = "../sg"
  vpc_id = var.vpc_id
  zones  = var.zones
  env    = var.env
  owner  = var.owner
}

module iam {
  source = "../iam"
  env    = var.env
  owner  = var.owner
}
