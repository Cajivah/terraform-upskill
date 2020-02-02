locals {
  generics_private_subnet_ids    = data.terraform_remote_state.generics.outputs.private_subnet_ids
  generics_web_sg_id             = data.terraform_remote_state.generics.outputs.web_sg_id
  generics_vpc_id                = data.terraform_remote_state.generics.outputs.vpc_id
  generics_db_subnet_ids         = data.terraform_remote_state.generics.outputs.db_subnet_ids
  generics_db_sg_ids             = data.terraform_remote_state.generics.outputs.db_sg_ids
  generics_public_subnet_ids     = data.terraform_remote_state.generics.outputs.public_subnet_ids
  generics_alb_sg_ids            = data.terraform_remote_state.generics.outputs.alb_sg_ids
  generics_instance_profile_name = data.terraform_remote_state.generics.outputs.instance_profile_name

  subdomain = "jmalyjasiak"
  app_name  = "app"
}
