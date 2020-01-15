locals {
  network_state_web_subnet_ids = data.terraform_remote_state.network.outputs.web_subnet_ids
  network_state_web_sg_id = data.terraform_remote_state.network.outputs.web_sg_id
  network_state_vpc_id = data.terraform_remote_state.network.outputs.vpc_id
  network_state_db_subnet_ids = data.terraform_remote_state.network.outputs.db_subnet_ids
  network_state_db_sg_ids = data.terraform_remote_state.network.outputs.db_sg_ids
  network_state_alb_subnet_ids = data.terraform_remote_state.network.outputs.alb_subnet_ids
  network_state_alb_sg_ids = data.terraform_remote_state.network.outputs.alb_sg_ids
}
