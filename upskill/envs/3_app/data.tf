data "terraform_remote_state" "generics" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = var.generics_state_key
    region = var.region
  }
}

data "terraform_remote_state" "db" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = var.db_state_key
    region = var.region
  }
}
