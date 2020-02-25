locals {
  state_bucket       = "jmalyjasiak-upskill"
  generics_state_key = "env:/${terraform.workspace}/envs/generics/terraform.tfstate"
  db_state_key       = "env:/${terraform.workspace}/envs/db/terraform.tfstate"

  generics_private_subnet_ids    = data.terraform_remote_state.generics.outputs.private_subnet_ids
  generics_web_sg_id             = data.terraform_remote_state.generics.outputs.web_sg_id
  generics_vpc_id                = data.terraform_remote_state.generics.outputs.vpc_id
  generics_public_subnet_ids     = data.terraform_remote_state.generics.outputs.public_subnet_ids
  generics_alb_sg_ids            = data.terraform_remote_state.generics.outputs.alb_sg_ids
  generics_instance_profile_name = data.terraform_remote_state.generics.outputs.instance_profile_name

  db_address      = data.terraform_remote_state.db.outputs.address
  db_port         = data.terraform_remote_state.db.outputs.port
  db_username_key = data.terraform_remote_state.db.outputs.web_db_username_key
  db_password_key = data.terraform_remote_state.db.outputs.web_db_password_key

  subdomain = "jmalyjasiak"
  app_name  = "app"
}
