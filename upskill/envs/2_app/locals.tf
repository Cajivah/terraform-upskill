locals {
  network_state_web_subnet_ids = data.terraform_remote_state.network.outputs.web_subnet_ids
  network_state_web_sg_id = data.terraform_remote_state.network.outputs.web_sg_id
  network_state_vpc_id = data.terraform_remote_state.network.outputs.vpc_id
}
