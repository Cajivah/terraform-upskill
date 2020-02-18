locals {

  generics_state_bucket  = "jmalyjasiak-upskill"
  generics_state_key     = "env:/${terraform.workspace}/envs/generics/terraform.tfstate"
  generics_db_subnet_ids = data.terraform_remote_state.generics.outputs.db_subnet_ids
  generics_db_sg_ids     = data.terraform_remote_state.generics.outputs.db_sg_ids
  app_name               = "app"
  db_name                = "db"

  db_username_key = "${terraform.workspace}_${var.owner}_${local.app_name}_${local.db_name}_username"
  db_password_key = "${terraform.workspace}_${var.owner}_${local.app_name}_${local.db_name}_password"
}
