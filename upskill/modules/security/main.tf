module sg {
  source = "../sg"
  vpc_id = var.vpc_id
  zones  = var.zones
}

module iam {
  source = "../iam"
  env    = var.env
  name   = var.name
}
