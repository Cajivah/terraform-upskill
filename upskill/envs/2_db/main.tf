module "db" {
  source             = "../../modules/db"
  db_name            = local.db_name
  db_username_key    = local.db_username_key
  db_password_key    = local.db_password_key
  zones              = var.zones
  subnet_ids         = local.generics_db_subnet_ids
  security_group_ids = local.generics_db_sg_ids
  tags               = var.tags
  env                = var.env
  owner              = var.owner
  identifier         = local.app_name
}
