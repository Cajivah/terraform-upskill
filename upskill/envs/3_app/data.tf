data "terraform_remote_state" "generics" {
  backend = "s3"

  config = {
    bucket = local.state_bucket
    key    = local.generics_state_key
    region = var.region
  }
}

data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = local.state_bucket
    key    = local.db_state_key
    region = var.region
  }
}
