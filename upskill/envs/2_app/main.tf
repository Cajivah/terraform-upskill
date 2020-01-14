module "web_server" {
  source = "../../modules/web_server"
  zones = var.zones
  security_group_id = local.network_state_web_sg_id
  subnet_ids = local.network_state_web_subnet_ids
  vpc_id = local.network_state_vpc_id
}

module "db" {
  source = "../../modules/db"
  db_password = "admin"
  db_name = "test"
  zones = var.zones
  subnet_ids = data.terraform_remote_state.network.outputs.db_subnet_ids
  security_group_ids   = data.terraform_remote_state.network.outputs.db_sg_ids
}
